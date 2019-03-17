#!/usr/bin/env python3
# -*- coding: utf-8 -*-

"""
This script is used to update and generate the files.

Authors:
    - @Funilrys, Nissar Chababy <contactTAfunilrysTODcom>
    - @mitchellkrogza, Mitchell Krog <mitchellkrogTAgmailTODcom

Contributors:
    Let's contribute !

    @GitHubUsername, Name, Email (optional)
"""

# pylint: disable=too-many-lines, bad-continuation

from collections import OrderedDict
from itertools import chain, filterfalse
from json import decoder, dump, loads
from multiprocessing import Manager, Process
from os import environ, makedirs, path, remove
from os import sep as directory_separator
from os import walk
from re import compile as comp
from re import escape
from re import sub as substrings
from subprocess import PIPE, Popen
from tarfile import open as tarfile_open
from time import strftime
from zipfile import ZipFile

from PyFunceble import ipv4_syntax_check, syntax_check
from requests import get
from ultimate_hosts_blacklist.whitelist import clean_list_with_official_whitelist


class Settings:  # pylint: disable=too-few-public-methods
    """
    This class will save all data that can be called from anywhere in the code.
    """

    # This is the username we use to connect to the GitHub API.
    github_api_username = "mitchellkrogza"

    try:
        # This is the GitHub API token to use.
        github_api_token = environ["GH_TOKEN"]
    except KeyError:
        github_api_token = ""

    # This variable set the GitHub repository slug.
    #
    # Note: DO NOT TOUCH UNLESS YOU KNOW WHAT IT MEANS!for
    github_org_slug = "Ultimate-Hosts-Blacklist"

    # This variable set the github api url.
    #
    # Note: DO NOT TOUCH UNLESS YOU KNOW WHAT IT MEANS!
    github_api_url = "https://api.github.com"

    # This variable set the github raw url.
    #
    # Note: DO NOT TOUCH UNLESS YOU KNOW WHAT IT MEANS!
    github_raw_url = "https://raw.githubusercontent.com/"

    # This variable set the deploy raw url.
    #
    # Note: DO NOT TOUCH UNLESS YOU KNOW WHAT IT MEANS!
    deploy_raw_url = "https://hosts.ubuntu101.co.za/update_hosts.php"

    # This variable set the partially full url when attempting to get the
    # raw file.
    #
    # Note: DO NOT TOUCH UNLESS YOU KNOW WHAT IT MEANS!
    raw_link = github_raw_url + github_org_slug + "/%s/master/"

    # This variable the organisation url.
    #
    # Note: DO NOT TOUCH UNLESS YOU KNOW WHAT IT MEANS!
    github_api_org_url = "%s/orgs/%s" % (github_api_url, github_org_slug)

    # This variable save the list of repository.
    #
    # Note: DO NOT TOUCH UNLESS YOU KNOW WHAT IT MEANS!
    # Note: This variable is auto updated by Initiate()
    repositories = []

    # This variable set the repository to ignore.
    repo_to_ignore = ["repository-structure", "whitelist", "dev-center", "cleaning"]

    # This variable save the list of all domains.
    #
    # Note: DO NOT TOUCH UNLESS YOU KNOW WHAT IT MEANS!
    # Note: This variable is auto updated by Initiate()
    domains = []

    # This variable save the list of all ips.
    #
    # Note: DO NOT TOUCH UNLESS YOU KNOW WHAT IT MEANS!
    # Note: This variable is auto updated by Initiate()
    ips = []

    try:
        # This variable set the version which is going to be appended to all
        # templates files
        version = "V1.%s.%s.%s.%s" % (
            environ["TRAVIS_BUILD_NUMBER"],
            strftime("%Y"),
            strftime("%m"),
            strftime("%d"),
        )
    except KeyError:
        version = strftime("%s")

    # This variable set the location of the templates directory.
    #
    # Note: DO NOT TOUCH UNLESS YOU KNOW WHAT IT MEANS!
    templates_directory = "templates" + directory_separator

    # This variable set the directory which will contain the dotted formatted files.
    #
    # Note: DO NOT TOUCH UNLESS YOU KNOW WHAT IT MEANS!
    dotted_directory = "domains-dotted-format"

    # This variable set the name of the dotted domains file.
    #
    # Note: DO NOT TOUCH UNLESS YOU KNOW WHAT IT MEANS!
    dotted_file = "domains-dotted-format{}.list"

    # This variable set the directory which will contain the plain text formatted domains files.
    #
    # Note: DO NOT TOUCH UNLESS YOU KNOW WHAT IT MEANS!
    plain_text_domains_directory = "domains"

    # This variable set the name of the plain text domains file.
    #
    # Note: DO NOT TOUCH UNLESS YOU KNOW WHAT IT MEANS!
    plain_text_domains_file = "domains{}.list"

    # This variable set the directory which will contain the plain text formatted ips files.
    #
    # Note: DO NOT TOUCH UNLESS YOU KNOW WHAT IT MEANS!
    plain_text_ips_directory = "ips"

    # This variable set the name of the plain text ips file.
    #
    # Note: DO NOT TOUCH UNLESS YOU KNOW WHAT IT MEANS!
    plain_text_ips_file = "ips{}.list"

    # This variable set the directory which will contain the hosts.deny formatted files.
    #
    # Note: DO NOT TOUCH UNLESS YOU KNOW WHAT IT MEANS!
    hosts_deny_directory = "hosts.deny"

    # This variable set the name of the hosts.deny file.
    #
    # Note: DO NOT TOUCH UNLESS YOU KNOW WHAT IT MEANS!
    hosts_deny_file = "hosts{}.deny"

    # This variable set the name of the file we are going
    # to use to save GitHub eTags.
    #
    # Note: DO NOT TOUCH UNLESS YOU KNOW WHAT IT MEANS!
    etags_file = "etags.json"

    # this variable set the name of the file we are going
    # to use to save the list of our Backend repositories.
    #
    # Note: DO NOT TOUCH UNLESS YOU KNOW WHAT IT MEANS!
    repositories_file = "repos.json"

    # This variable set the name of the hosts.deny template.
    #
    # Note: DO NOT TOUCH UNLESS YOU KNOW WHAT IT MEANS!
    hosts_deny_template = templates_directory + "hostsdeny.template"

    # This variable set the directory which will contain the superhosts.deny formatted files.
    #
    # Note: DO NOT TOUCH UNLESS YOU KNOW WHAT IT MEANS!
    superhosts_deny_directory = "superhosts.deny"

    # This variable set the name of the superhosts.deny file.
    #
    # Note: DO NOT TOUCH UNLESS YOU KNOW WHAT IT MEANS!
    superhosts_deny_file = "superhosts{}.deny"

    # This variable set the name of the hosts.deny template.
    #
    # Note: DO NOT TOUCH UNLESS YOU KNOW WHAT IT MEANS!
    superhosts_deny_template = templates_directory + "superhostsdeny.template"

    # This variable set the directory which will contain the hosts.windows formatted files.
    #
    # Note: DO NOT TOUCH UNLESS YOU KNOW WHAT IT MEANS!
    hosts_windows_directory = "hosts.windows"

    # This variable set the name of the hosts.windows file.
    #
    # Note: DO NOT TOUCH UNLESS YOU KNOW WHAT IT MEANS!
    hosts_windows_file = "hosts{}.windows"

    # This variable set the name of the hosts.windows template.
    #
    # Note: DO NOT TOUCH UNLESS YOU KNOW WHAT IT MEANS!
    hosts_windows_template = templates_directory + "hosts.windows.template"

    # This variable set the directory which will contain the hosts formatted files.
    #
    # Note: DO NOT TOUCH UNLESS YOU KNOW WHAT IT MEANS!
    hosts_unix_directory = "hosts"

    # This variable set the name of the hosts file.
    #
    # Note: DO NOT TOUCH UNLESS YOU KNOW WHAT IT MEANS!
    hosts_unix_file = "hosts{}"

    # This variable set the name of the hosts template.
    #
    # Note: DO NOT TOUCH UNLESS YOU KNOW WHAT IT MEANS!
    hosts_unix_template = templates_directory + "hosts.template"

    # This variable set the name of the README.md file.
    #
    # Note: DO NOT TOUCH UNLESS YOU KNOW WHAT IT MEANS!
    readme_md_file = "README.md"

    # This variable set the name of the hosts.windows template.
    #
    # Note: DO NOT TOUCH UNLESS YOU KNOW WHAT IT MEANS!
    readme_me_template = templates_directory + "README_template.md"

    # This variable set the char to use when something is done.
    done = "✔"

    # This variable set the char to use when an error occured
    error = "✘"


class TravisCI:  # pylint:disable=too-few-public-methods
    """
    Manage everything we need when we are under Travis CI.
    """

    def __init__(self, init_repo=True):
        if init_repo:
            try:
                _ = environ["TRAVIS_BUILD_DIR"]

                print("Cleaning remote", end=" ")
                Helpers.Command("git remote rm origin", True).execute()
                print(Settings.done)

                print("Adding remote with GH_TOKEN", end=" ")
                Helpers.Command(
                    "git remote add origin https://"
                    + "%s@github.com/%s.git"
                    % (environ["GH_TOKEN"], environ["TRAVIS_REPO_SLUG"]),
                    True,
                ).execute()
                print(Settings.done)

                print("Updating git.user.email", end=" ")
                Helpers.Command(
                    'git config --global user.email "%s"' % (environ["GIT_EMAIL"]), True
                ).execute()
                print(Settings.done)

                print("Updating git.user.name", end=" ")
                Helpers.Command(
                    'git config --global user.name "%s"' % (environ["GIT_NAME"]), True
                ).execute()
                print(Settings.done)

                print("Update of git.push.default", end=" ")
                Helpers.Command(
                    "git config --global push.default simple", True
                ).execute()
                print(Settings.done)

                print("Checkout of %s" % repr(environ["GIT_BRANCH"]), end=" ")
                Helpers.Command(
                    "git checkout %s" % environ["GIT_BRANCH"], True
                ).execute()
                print(Settings.done)

            except KeyError:
                pass

    @classmethod
    def fix_permissions(cls):
        """
        Fix the permissions of TRAVIS_BUILD_DIR.
        """

        try:
            build_dir = environ["TRAVIS_BUILD_DIR"]
            commands = [
                "sudo chown -R travis:travis %s" % (build_dir),
                "sudo chgrp -R travis %s" % (build_dir),
                "sudo chmod -R g+rwX %s" % (build_dir),
                "sudo chmod 777 -Rf %s.git" % (build_dir + directory_separator),
                r"sudo find %s -type d -exec chmod g+x '{}' \;" % (build_dir),
            ]

            for command in commands:
                Helpers.Command(command, True).execute()

            if (
                Helpers.Command("git config core.sharedRepository", False).execute()
                == ""
            ):
                Helpers.Command(
                    "git config core.sharedRepository group", False
                ).execute()
        except KeyError:
            pass


class Repositories:  # pylint: disable=too-few-public-methods
    """
    Get and return the list of repositories of our backend.
    """

    def __init__(self):
        self.url_to_get = (
            "%s/repos?sort=created&direction=desc" % Settings.github_api_org_url
        )
        self.headers = {
            "Accept": "application/vnd.github.v3+json",
            "Authorization": "token %s",
        }

        if path.isfile(Settings.etags_file):
            self.etags = Helpers.Dict.from_json(
                Helpers.File(Settings.etags_file).read()
            )
        else:
            self.etags = {}

        if Settings.github_api_token:
            self.headers["Authorization"] %= Settings.github_api_token
        else:
            del self.headers["Authorization"]

        self.regex_next_url = r"(?:.*\<(.*?)\>\;\s?rel\=\"next\")"

    def get(self, url_to_get=None):  # pylint: disable=too-many-branches
        """
        Return the data from the API or from the local file if nothing changed.
        """

        next_url = None
        if not url_to_get:
            url_to_get = self.url_to_get

        if self.etags and url_to_get in self.etags:
            self.headers["If-None-Match"] = self.etags[url_to_get]

        req = get(url_to_get, headers=self.headers)

        if req.status_code == 200:
            data = req.json()
            repos = []

            if "Etag" in req.headers:
                self.etags[url_to_get] = req.headers["Etag"]
                Helpers.Dict(self.etags).to_json(Settings.etags_file)

            if isinstance(data, list):
                repos.extend(data)
            else:
                raise Exception(
                    "Unable to understand GitHub API response for: '%s'." % url_to_get
                )

            if "Link" in req.headers:
                next_url = Helpers.Regex(
                    req.headers["Link"], self.regex_next_url, group=1, return_data=True
                ).match()

                if next_url:
                    for element in self.get(url_to_get=next_url):
                        if element["name"] not in Settings.repo_to_ignore:
                            yield element
                        else:
                            continue

            if repos:
                for element in repos:
                    if element["name"] not in Settings.repo_to_ignore:
                        yield element
                    else:
                        continue

        elif req.status_code == 304:
            data = Helpers.Dict.from_json(
                Helpers.File(Settings.repositories_file).read()
            )

            for element in data:
                if element["name"] not in Settings.repo_to_ignore:
                    yield element
                else:
                    continue
        elif req.status_code == 401:
            raise Exception("Bad GitHub credentials.")
        else:
            raise Exception(
                "Somethign went wrong while communicating with: '%s'." % url_to_get
            )


class Generate:
    """
    This class generate what we need.
    """

    max_size = 5_242_880

    def __init__(self):
        print("\n")
        self.dotted_format()
        self.plain_text_domain_format()
        self.plain_text_ips_format()
        self.hosts_deny_format()
        self.super_hosts_deny_format()
        self.hosts_windows_format()
        self.hosts_unix_format()
        self.readme_md()
        print("\n")

    @classmethod
    def next_file(
        cls,
        directory_name,
        file_name,
        format_to_apply,
        subject,
        template=None,
        endline=None,
    ):  # pylint:disable=too-many-arguments, too-many-locals
        """
        Generate the next file.
        """

        if path.isdir(directory_name):
            for root, _, files in walk(directory_name):
                for file in files:
                    Helpers.File(f"{root}{directory_separator}{file}").delete()
        else:
            makedirs(directory_name)

        i = 0
        element_index = 0

        while True:
            broken = False
            destination = f"{directory_name}{directory_separator}{file_name.format(i)}"

            print(f"Generation of {destination}", end=" ")
            with open(destination, "w", encoding="utf-8") as file:
                if not i and template:
                    file.write(template)

                for element in chain(subject[element_index:]):
                    file.write(f"{format_to_apply}\n".format(element))
                    element_index += 1

                    if file.tell() >= cls.max_size:
                        i += 1
                        print(Settings.done)
                        broken = True
                        break
                if broken:
                    continue

                if endline:
                    file.write(endline)
                print(Settings.done)
            break

    @classmethod
    def dotted_format(cls):
        """
        This method will generate the dotted domains file.
        """

        cls.next_file(
            Settings.dotted_directory, Settings.dotted_file, ".{}", Settings.domains
        )

    @classmethod
    def plain_text_domain_format(cls):
        """
        This method will generate the file with only plain domain.
        """

        cls.next_file(
            Settings.plain_text_domains_directory,
            Settings.plain_text_domains_file,
            "{}",
            Settings.domains,
        )

    @classmethod
    def plain_text_ips_format(cls):
        """
        This method will generate the file with only plain domain.
        """

        cls.next_file(
            Settings.plain_text_ips_directory,
            Settings.plain_text_ips_file,
            "{}",
            Settings.ips,
        )

    @classmethod
    def hosts_deny_format(cls):
        """
        This method will generate the file in hosts.deny format.
        """

        template = Helpers.File(Settings.hosts_deny_template).read()

        template = Helpers.Regex(
            template, r"%%version%%", replace_with=Settings.version
        ).replace()
        template = Helpers.Regex(
            template, r"%%lenIP%%", replace_with=format(len(Settings.ips), ",d")
        ).replace()

        cls.next_file(
            Settings.hosts_deny_directory,
            Settings.hosts_deny_file,
            "ALL: {}",
            Settings.ips,
            template=template,
            endline="# ##### END hosts.deny Block List # DO NOT EDIT #####",
        )

    @classmethod
    def super_hosts_deny_format(cls):
        """
        This method will generate the file in superhosts.deny format.
        """

        template = Helpers.File(Settings.superhosts_deny_template).read()

        template = Helpers.Regex(
            template, r"%%version%%", replace_with=Settings.version
        ).replace()
        template = Helpers.Regex(
            template,
            r"%%lenIPHosts%%",
            replace_with=format(len(Settings.ips) + len(Settings.domains), ",d"),
        ).replace()

        hosts_ip = Settings.ips + Settings.domains

        cls.next_file(
            Settings.superhosts_deny_directory,
            Settings.superhosts_deny_file,
            "ALL: {}",
            hosts_ip,
            template=template,
            endline="# ##### END Super hosts.deny Block List # DO NOT EDIT #####",
        )

    @classmethod
    def hosts_windows_format(cls):
        """
        This method will generate the file in hosts.windows format.
        """

        template = Helpers.File(Settings.hosts_windows_template).read()

        template = Helpers.Regex(
            template, r"%%version%%", replace_with=Settings.version
        ).replace()
        template = Helpers.Regex(
            template, r"%%lenHosts%%", replace_with=format(len(Settings.domains), ",d")
        ).replace()

        cls.next_file(
            Settings.hosts_windows_directory,
            Settings.hosts_windows_file,
            "127.0.0.1 {}",
            Settings.domains,
            template=template,
            endline="# END HOSTS LIST ### DO NOT EDIT THIS LINE AT ALL ###",
        )

    @classmethod
    def hosts_unix_format(cls):
        """
        This method will generate the file in hosts format.
        """

        template = Helpers.File(Settings.hosts_unix_template).read()

        template = Helpers.Regex(
            template, r"%%version%%", replace_with=Settings.version
        ).replace()
        template = Helpers.Regex(
            template, r"%%lenHosts%%", replace_with=format(len(Settings.domains), ",d")
        ).replace()

        cls.next_file(
            Settings.hosts_unix_directory,
            Settings.hosts_unix_file,
            "0.0.0.0 {}",
            Settings.domains,
            template=template,
            endline="# END HOSTS LIST ### DO NOT EDIT THIS LINE AT ALL ###",
        )

    @classmethod
    def readme_md(cls):
        """
        This methos will generate the REAMDE.md.
        """

        template = Helpers.File(Settings.readme_me_template).read()

        template = Helpers.Regex(
            template, r"%%version%%", replace_with=Settings.version
        ).replace()
        template = Helpers.Regex(
            template, r"%%lenHosts%%", replace_with=format(len(Settings.domains), ",d")
        ).replace()
        template = Helpers.Regex(
            template, r"%%lenIPs%%", replace_with=format(len(Settings.ips), ",d")
        ).replace()
        template = Helpers.Regex(
            template,
            r"%%lenHostsIPs%%",
            replace_with=format(len(Settings.ips) + len(Settings.domains), ",d"),
        ).replace()

        print("Generation of %s" % Settings.readme_md_file, end=" ")
        Helpers.File(Settings.readme_md_file).write(template, overwrite=True)
        print(Settings.done)


class Compress:  # pylint: disable=too-few-public-methods
    """
    This class run and manage the compression
    """

    def __init__(self):
        to_compresss = [
            Settings.dotted_file,
            Settings.plain_text_domains_file,
            Settings.plain_text_ips_file,
            Settings.hosts_deny_file,
            Settings.superhosts_deny_file,
            Settings.hosts_windows_file,
            Settings.hosts_unix_file,
        ]

        for file in to_compresss:
            compress_into_tar_gz = "%s.tar.gz" % file

            print("\n")
            print("Compression of %s into %s" % (file, compress_into_tar_gz), end=" ")
            Helpers.File(file).tar_gz_compress(compress_into_tar_gz)
            print(Settings.done)

            print("Deletion of %s" % file, end=" ")
            Helpers.File(file).delete()
            print(Settings.done)


class Deploy:  # pylint: disable=too-few-public-methods
    """
    This class will deploy our files to upstream.
    """

    def __init__(self):
        try:
            _ = environ["TRAVIS_BUILD_DIR"]
            commit_message = "%s [ci skip]" % Settings.version

            TravisCI(init_repo=False).fix_permissions()

            Helpers.Command(
                "git add --all && git commit -a -m '%s' && git push origin %s"
                % (commit_message, environ["GIT_BRANCH"]),
                False,
            ).execute()

            get(Settings.deploy_raw_url)
        except KeyError:
            pass


class Helpers:  # pylint: disable=too-few-public-methods
    """
    Well, thanks to those helpers :-)
    """

    class List:  # pylint: disable=too-few-public-methods
        """
        List manipulation.
        """

        def __init__(self, main_list=None):
            if main_list is None:
                self.main_list = []
            else:
                self.main_list = main_list

        def format(self):
            """
            Return a well formated list. Basicaly, it's sort a list and remove duplicate.
            """

            without_duplicate = list(OrderedDict.fromkeys(self.main_list))

            try:
                return sorted(without_duplicate, key=str.lower)
            except TypeError:
                return without_duplicate

    class File:  # pylint: disable=too-few-public-methods
        """
        File treatment/manipulations.

        Arguments:
            file: str
                Path to the file to manipulate.
        """

        def __init__(self, file):
            self.file = file

        def read(self):
            """
            Read a given file path and return its content.
            """

            with open(self.file, "r", encoding="utf-8") as file:
                funilrys = file.read()

            return funilrys

        def write(self, data_to_write, overwrite=False):
            """
            Write or append data into the given file path.

            :param data_to_write: A string, the data to write.
            """

            if data_to_write is not None and isinstance(data_to_write, str):
                if overwrite or not path.isfile(self.file):
                    with open(self.file, "w", encoding="utf-8") as file:
                        file.write(data_to_write)
                else:
                    with open(self.file, "a", encoding="utf-8") as file:
                        file.write(data_to_write)

        def zip_compress(self, destination):
            """
            Compress a file into a zip.

            Argument:
                - destination: str
                    The destination of the compressed file.
            """

            if destination is not None and isinstance(destination, str):
                with ZipFile(destination, "w") as thezip:
                    thezip.write(self.file)

        def tar_gz_compress(self, destination):
            """
            Compress a file into a tar.gz.

            Argument:
                - destination: str
                    The destination of the compressed file.
            """

            if destination is not None and isinstance(destination, str):
                with tarfile_open(destination, "w:gz") as tar:
                    tar.add(self.file)

        def delete(self):
            """
            Delete a given file path.
            """

            try:
                remove(self.file)
            except OSError:
                pass

    class Regex:  # pylint: disable=too-few-public-methods

        """A simple implementation ot the python.re package


        :param data: A string, the data to regex check
        :param regex: A string, the regex to match
        :param return_data: A boolean, if True, return the matched string
        :param group: A integer, the group to return
        :param rematch: A boolean, if True, return the matched groups into a
            formated list. (implementation of Bash ${BASH_REMATCH})
        :param replace_with: A string, the value to replace the matched regex with.
        :param occurences: A int, the number of occurence to replace.
        """

        def __init__(self, data, regex, **args):
            # We initiate the needed variable in order to be usable all over
            # class
            self.data = data

            # We assign the default value of our optional arguments
            optional_arguments = {
                "escape": False,
                "group": 0,
                "occurences": 0,
                "rematch": False,
                "replace_with": None,
                "return_data": True,
            }

            # We initiate our optional_arguments in order to be usable all over the
            # class
            for (arg, default) in optional_arguments.items():
                setattr(self, arg, args.get(arg, default))

            if self.escape:  # pylint: disable=no-member
                self.regex = escape(regex)
            else:
                self.regex = regex

        def match(self):
            """Used to get exploitable result of re.search"""

            # We initate this variable which gonna contain the returned data
            result = []

            # We compile the regex string
            to_match = comp(self.regex)

            # In case we have to use the implementation of ${BASH_REMATCH} we use
            # re.findall otherwise, we use re.search
            if self.rematch:  # pylint: disable=no-member
                pre_result = to_match.findall(self.data)
            else:
                pre_result = to_match.search(self.data)

            if self.return_data and pre_result is not None:  # pylint: disable=no-member
                if self.rematch:  # pylint: disable=no-member
                    for data in pre_result:
                        if isinstance(data, tuple):
                            result.extend(list(data))
                        else:
                            result.append(data)

                    if self.group != 0:  # pylint: disable=no-member
                        return result[self.group]  # pylint: disable=no-member
                else:
                    result = pre_result.group(
                        self.group  # pylint: disable=no-member
                    ).strip()

                return result
            elif (
                not self.return_data  # pylint: disable=no-member
                and pre_result is not None
            ):
                return True
            return False

        def not_matching_list(self):
            """
            This method return a list of string which don't match the
            given regex.
            """

            pre_result = comp(self.regex)

            return list(
                filter(lambda element: not pre_result.search(element), self.data)
            )

        def replace(self):
            """Used to replace a matched string with another."""

            if self.replace_with is not None:  # pylint: disable=no-member
                return substrings(
                    self.regex,
                    self.replace_with,  # pylint: disable=no-member
                    self.data,
                    self.occurences,  # pylint: disable=no-member
                )
            return self.data

    class Command:
        """
        Shell command execution.

        Arguments:
            command: A string, the command to execute.
            allow_stdout: A bool, If true stdout is always printed otherwise stdout
                is passed to PIPE.
        """

        def __init__(self, command, allow_stdout=True):
            self.decode_type = "utf-8"
            self.command = command

            if not allow_stdout:
                self.process = Popen(self.command, stdout=PIPE, stderr=PIPE, shell=True)
            else:
                self.process = Popen(self.command, stderr=PIPE, shell=True)

        def decode_output(self, to_decode):
            """Decode the output of a shell command in order to be readable.

            Arguments:
                to_decode: byte(s), Output of a command to decode.
            """
            if to_decode is not None:
                # return to_decode.decode(self.decode_type)
                return str(to_decode, self.decode_type)
            return False

        def execute(self):
            """
            Execute the given command and wait until it ends to return its output.
            """

            (output, error) = self.process.communicate()

            if self.process.returncode != 0:
                decoded = self.decode_output(error)

                if not decoded:
                    return "Unkown error. for %s" % (self.command)

                print(decoded)
                exit(1)
            return self.decode_output(output)

        def run_command(self):
            """
            Run the given command and return its output directly to stdout.
            """

            while True:
                current_line = self.process.stdout.readline().rstrip()

                if not current_line:
                    break

                yield self.decode_output(current_line)

    class Dict:
        """
        Dictionary manipulations.

        :param main_dictionnary: The dict we are working with.
        :type main_dictionnary: dict
        """

        def __init__(self, main_dictionnary=None):  # pragma: no cover

            if main_dictionnary is None:
                # A dictionnary is not parsed.

                # We set the main dictionnary as an empty dictionnary.
                self.main_dictionnary = {}
            else:
                # A dictionnary is parsed.

                # We set the main dictionnary as the parsed dictionnary.
                self.main_dictionnary = main_dictionnary

        def to_json(self, destination):
            """
            Save a dictionnary into a JSON file.

            :param destination:
                A path to a file where we're going to
                write the converted dict into a JSON format.
            :type destination: str
            """

            with open(destination, "w") as file:
                # We open the file we are going to write.
                # Note: We always overwrite the destination.

                # We save the current dictionnary into a json format.
                dump(
                    self.main_dictionnary,
                    file,
                    ensure_ascii=False,
                    indent=4,
                    sort_keys=True,
                )

        @classmethod
        def from_json(cls, data):
            """
            Convert a JSON formatted string into a dictionary.

            :param data: A JSON formatted string to convert to dict format.
            :type data: str

            :return: The dict representation of the JSON formatted string.
            :rtype: dict
            """

            try:
                # Read a json string and convert it to dictionnary.
                return loads(data)

            except decoder.JSONDecodeError:  # pragma: no cover
                # In case the decoder return an error,
                # we return and empty dictionnary.
                return {}


class Clean:  # pylint: disable=too-few-public-methods
    """
    Clean uneeded files.
    """

    def __init__(self):
        to_delete = [
            "public-suffix.json",
            "iana-domains-db.json",
            ".PyFunceble.yaml",
            ".PyFunceble_production.yaml",
            "dir_structure.json",
            "whois_db",
        ]

        for element in to_delete:
            Helpers.File(element).delete()


class UpdateThisRepository:
    """
    Update this repository and our mirror.
    """

    def __init__(self):
        self.travis = TravisCI()
        self.travis.fix_permissions()

        self.repos = list(Repositories().get())

    @classmethod
    def __format_lines(cls, lines):
        """
        Format the given lines.
        """

        result = []

        for line in filterfalse(lambda x: not x, lines):
            if not line.startswith("#"):
                if "#" in line:
                    line = line[: line.find("#")]

                if "\t" in line or " " in line:
                    splited_line = line.split()

                    for element in splited_line[:1]:
                        if element:
                            line = element
                            break
            result.append(line)

        return result

    @classmethod
    def __get_whitelisted_list(cls, to_clean):
        """
        Given a list or a string (1 domain per line),
        we remove the whitelisted elements and return
        the list of non whitelisted element.

        :param to_clean: The list to clean.
        :type to_clean: str or list

        :return: Clean list.
        :rtype: list
        """

        if isinstance(to_clean, str):
            return clean_list_with_official_whitelist(to_clean.split("\n"))

        if isinstance(to_clean, list):
            return clean_list_with_official_whitelist(to_clean)
        raise Exception("Unknown type: `%s`" % type(to_clean))

    def get_repos_lists(self, repo_information, manager_list):
        """
        Read the list of available repos and get the list of domains/ip from the
        input source.
        """

        Settings.repositories.append(repo_information)

        print(
            "Extracting, cleaning and formating of domains and ips from %s"
            % repo_information["name"],
            end=" ",
        )

        url_to_get_base = Settings.raw_link % repo_information["name"]
        clean_url = "%sclean.list" % url_to_get_base
        non_clean_url = "%sdomains.list" % url_to_get_base

        req_clean = get(clean_url)

        if req_clean.status_code == 200:
            manager_list.append(self.__get_whitelisted_list(req_clean.text))
            print(Settings.done)
            return None

        req_non_clean = get(non_clean_url)

        if req_non_clean.status_code == 200:
            manager_list.append(self.__get_whitelisted_list(req_non_clean.text))
            print(Settings.done)
            return None

        print(Settings.error)
        raise Exception("Unable to get a list from '%s'" % repo_information["name"])

    @classmethod
    def __separate_domains_from_ip(cls, cleaned_list):
        """
        Given a cleaned list, we separate domains from IP.
        """

        domains = [x for x in set(cleaned_list) if x and syntax_check(x)]
        temp = set(cleaned_list) - set(domains)

        return (domains, [x for x in temp if x and ipv4_syntax_check(x)])

    def process(self):
        """
        Process the logic behind the repository update.
        """

        manager_list = []

        with Manager() as manager:
            manager_list = manager.list()
            processes = []

            for data in self.repos:
                process = Process(
                    target=self.get_repos_lists, args=(data, manager_list)
                )
                process.start()
                processes.append(process)

            for proc in processes:
                proc.join()

            manager_list = list(manager_list)

            for index, element in enumerate(manager_list):
                print("Separating domains from IPs: part {}".format(index), end=" ")
                domains, ips = self.__separate_domains_from_ip(element)
                Settings.domains.extend(domains)
                Settings.ips.extend(ips)

                del domains, ips
                print(Settings.done)

        print("Deletion of duplicate domains.", end=" ")
        Settings.domains = Helpers.List(Settings.domains).format()
        print(Settings.done)

        print("Deletion of duplicate IPs.", end=" ")
        Settings.ips = Helpers.List(Settings.ips).format()
        print(Settings.done)

        print("Saving the list of repositories we worked with.", end=" ")
        Helpers.Dict(self.repos).to_json(Settings.repositories_file)
        print(Settings.done)

        del Settings.repositories

        Generate()
        # Compress()
        Deploy()
        Clean()


if __name__ == "__main__":
    UpdateThisRepository().process()
