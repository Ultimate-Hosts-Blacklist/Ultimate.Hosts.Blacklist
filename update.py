#!/usr/bin/env python3
# -*- coding: utf-8 -*-

"""
This module has been written because we are seeking a new repository structure.

Authors:
    - @Funilrys, Nissar Chababy <contactTAfunilrysTODcom>
    - @mitchellkrogza, Mitchell Krog <mitchellkrogTAgmailTODcom

Contributors:
    Let's contribute !

    @GitHubUsername, Name, Email (optional)
"""

# pylint: disable=too-many-lines

from os import environ, path, remove
from os import sep as directory_separator
from re import compile as comp
from re import escape
from re import sub as substrings
from socket import gaierror
from subprocess import PIPE, Popen
from tarfile import open as tarfile_open
from time import strftime
from zipfile import ZipFile

from requests import get


print("Is it Funilrys or %s ?" % repr(__name__))


class Settings(object):  # pylint: disable=too-few-public-methods
    """
    This class will save all data that can be called from anywhere in the code.
    """

    # This variable set the GitHub repository slug.
    #
    # Note: DO NOT TOUCH UNLESS YOU KNOW WHAT IT MEANS!
    github_org_slug = 'Ultimate-Hosts-Blacklist'

    # This variable set the name of the whitelist repository.
    #
    # Note: DO NOT TOUCH UNLESS YOU KNOW WHAT IT MEANS!
    whitelist_repo_name = 'whitelist'

    # This variable set the github api url.
    #
    # Note: DO NOT TOUCH UNLESS YOU KNOW WHAT IT MEANS!
    github_api_url = 'https://api.github.com'

    # This variable set the github raw url.
    #
    # Note: DO NOT TOUCH UNLESS YOU KNOW WHAT IT MEANS!
    github_raw_url = 'https://raw.githubusercontent.com/'

    # This variable set the deploy raw url.
    #
    # Note: DO NOT TOUCH UNLESS YOU KNOW WHAT IT MEANS!
    deploy_raw_url = 'https://hosts.ubuntu101.co.za/update_hosts.php'

    # This variable set the partially full url when attempting to get the
    # raw file.
    #
    # Note: DO NOT TOUCH UNLESS YOU KNOW WHAT IT MEANS!
    raw_link = github_raw_url + github_org_slug + '/%s/master/'

    # This variable the organisation url.
    #
    # Note: DO NOT TOUCH UNLESS YOU KNOW WHAT IT MEANS!
    github_org_url = '%s/orgs/%s' % (github_api_url, github_org_slug)

    # This variable save the list of repository.
    #
    # Note: DO NOT TOUCH UNLESS YOU KNOW WHAT IT MEANS!
    # Note: This variable is auto updated by Initiate()
    repositories = []

    # This variable set the repository to ignore.
    repo_to_ignore = ['repository-structure', 'whitelist']

    # This variable save the list of repo with `clean.list` to get.
    #
    # Note: DO NOT TOUCH UNLESS YOU KNOW WHAT IT MEANS!
    # Note: This variable is auto updated by Initiate()
    clean_list_repo = []

    # This variable save the list of repo with `domains.list` to get.
    #
    # Note: DO NOT TOUCH UNLESS YOU KNOW WHAT IT MEANS!
    # Note: This variable is auto updated by Initiate()
    domains_list_repo = []

    # This variable save the list of repo which are IP only.
    #
    # Note: DO NOT TOUCH UNLESS YOU KNOW WHAT IT MEANS!
    # Note: This variable is auto updated by Initiate()
    ip_list_repo = []

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

    # This variable save the list of all whitelisted domain.
    #
    # Note: DO NOT TOUCH UNLESS YOU KNOW WHAT IT MEANS!
    # Note: This variable is auto updated by Initiate()
    whitelist = []

    # This variable is used to set the marker that we use to say that we
    # match all occurence of the domain or IP.
    #
    # Note: DO NOT TOUCH UNLESS YOU KNOW WHAT IT MEANS!
    whitelist_all_marker = 'ALL '

    # This variable set the regex to use to catch IPv4.
    #
    # Note: DO NOT TOUCH UNLESS YOU KNOW WHAT IT MEANS!
    regex_ip4 = r'^(25[0-5]|2[0-4][0-9]|[01]?[0-9][0-9]?)\.(25[0-5]|2[0-4][0-9]|[01]?[0-9][0-9]?)\.(25[0-5]|2[0-4][0-9]|[01]?[0-9][0-9]?)\.(25[0-5]|2[0-4][0-9]|[01]?[0-9][0-9]?|[0-9]{1,}\/[0-9]{1,})$'  # pylint: disable=line-too-long

    # This variable set the regex to use to catch IPv4.
    #
    # Note: DO NOT TOUCH UNLESS YOU KNOW WHAT IT MEANS!
    regex_domain = r'^(?=.{0,253}$)(([a-z0-9][a-z0-9-]{0,61}[a-z0-9]|[a-z0-9])\.)+((?=.*[^0-9])([a-z0-9][a-z0-9-]{0,61}[a-z0-9]|[a-z0-9]))$'  # pylint: disable=line-too-long

    # This variable set the version which is going to be appended to all
    # templates files
    version = 'V1.%s.%s.%s.%s' % (environ['TRAVIS_BUILD_NUMBER'], strftime(
        '%Y'), strftime('%m'), strftime('%d'))

    # This variable set the location of the templates directory.
    #
    # Note: DO NOT TOUCH UNLESS YOU KNOW WHAT IT MEANS!
    templates_directory = 'templates' + directory_separator

    # This variable set the name of the dotted domains file.
    #
    # Note: DO NOT TOUCH UNLESS YOU KNOW WHAT IT MEANS!
    dotted_file = 'domains-dotted-format.list'

    # This variable set the name of the plain text domains file.
    #
    # Note: DO NOT TOUCH UNLESS YOU KNOW WHAT IT MEANS!
    plain_text_domains_file = 'domains.list'

    # This variable set the name of the plain text ips file.
    #
    # Note: DO NOT TOUCH UNLESS YOU KNOW WHAT IT MEANS!
    plain_text_ips_file = 'ips.list'

    # This variable set the name of the hosts.deny file.
    #
    # Note: DO NOT TOUCH UNLESS YOU KNOW WHAT IT MEANS!
    hosts_deny_file = 'hosts.deny'

    # This variable set the name of the hosts.deny template.
    #
    # Note: DO NOT TOUCH UNLESS YOU KNOW WHAT IT MEANS!
    hosts_deny_template = templates_directory + 'hostsdeny.template'

    # This variable set the name of the superhosts.deny file.
    #
    # Note: DO NOT TOUCH UNLESS YOU KNOW WHAT IT MEANS!
    superhosts_deny_file = 'superhosts.deny'

    # This variable set the name of the hosts.deny template.
    #
    # Note: DO NOT TOUCH UNLESS YOU KNOW WHAT IT MEANS!
    superhosts_deny_template = templates_directory + 'superhostsdeny.template'

    # This variable set the name of the hosts.windows file.
    #
    # Note: DO NOT TOUCH UNLESS YOU KNOW WHAT IT MEANS!
    hosts_windows_file = 'hosts.windows'

    # This variable set the name of the hosts.windows template.
    #
    # Note: DO NOT TOUCH UNLESS YOU KNOW WHAT IT MEANS!
    hosts_windows_template = templates_directory + 'hosts.windows.template'

    # This variable set the name of the hosts file.
    #
    # Note: DO NOT TOUCH UNLESS YOU KNOW WHAT IT MEANS!
    hosts_unix_file = 'hosts'

    # This variable set the name of the hosts template.
    #
    # Note: DO NOT TOUCH UNLESS YOU KNOW WHAT IT MEANS!
    hosts_unix_template = templates_directory + 'hosts.template'

    # This variable set the name of the README.md file.
    #
    # Note: DO NOT TOUCH UNLESS YOU KNOW WHAT IT MEANS!
    readme_md_file = 'README.md'

    # This variable set the name of the hosts.windows template.
    #
    # Note: DO NOT TOUCH UNLESS YOU KNOW WHAT IT MEANS!
    readme_me_template = templates_directory + 'README_template.md'

    # This variable set the char to use when something is done.
    done = '✔'

    # This variable set the char to use when an error occured
    error = '✘'


class Initiate(object):
    """
    This class is used as the main entry of the script.
    Please note that this class also initiate several actions before being
    used or called.
    """

    def __init__(self):
        print("Beginning of Initiate()")
        self.travis()
        Helpers.travis_permissions()
        self.get_whitelist()
        self.list_of_input_sources()
        self.data_extractor()

    @classmethod
    def travis(cls):
        """
        Initiate Travis CI settings.
        """

        print("Beginning of Initiate().travis()")

        print("Cleaning remote")
        Helpers.Command('git remote rm origin', True).execute()
        print("Adding remote with GH_TOKEN")
        Helpers.Command(
            "git remote add origin https://" +
            "%s@github.com/%s.git" %
            (environ['GH_TOKEN'],
             environ['TRAVIS_REPO_SLUG']),
            True).execute()
        print("Update of git.user.email")
        Helpers.Command(
            'git config --global user.email "%s"' %
            (environ['GIT_EMAIL']), True).execute()
        print("Update of git.user.name")
        Helpers.Command(
            'git config --global user.name "%s"' %
            (environ['GIT_NAME']), True).execute()
        print("Update of git.push.default")
        Helpers.Command(
            'git config --global push.default simple', True).execute()
        print("Checkout of %s" % repr(environ['GIT_BRANCH']))
        Helpers.Command(
            'git checkout %s' %
            environ['GIT_BRANCH'],
            True).execute()

        print("End of Initiate().travis()")

    @classmethod
    def _whitelist_parser(cls, line):
        """
        This method will get and parse all whitelist domain into
        Settings.whitelist.

        Argument:
            - line: str
                The extracted line.
        """

        if line and not line.startswith('#'):
            if line.startswith(Settings.whitelist_all_marker):
                to_check = line.split(Settings.whitelist_all_marker)[1]
            else:
                to_check = line

            if Helpers.Regex(
                    to_check,
                    Settings.regex_ip4,
                    return_data=False).match() or Helpers.Regex(
                        to_check,
                        Settings.regex_domain,
                        return_data=False).match():
                Settings.whitelist.append(line)

    def get_whitelist(self):
        """
        This method will get the list of whitelisted domain.
        """

        domains_url = (Settings.raw_link +
                       'domains.list') % Settings.whitelist_repo_name

        req = get(domains_url)

        print("Getting %s" % Settings.whitelist_repo_name, end=" ")
        if req.status_code == 200:
            list(map(self._whitelist_parser, req.text.split('\n')))

            Settings.whitelist = Helpers.List(Settings.whitelist).format()
            print(Settings.done)
        else:
            print(Settings.error)

    @classmethod
    def list_of_input_sources(cls, return_data=False):
        """
        This method get the list of input sources to check.
        """

        url_to_get = Settings.github_org_url + '/repos'

        pages_finder = get(url_to_get)

        if pages_finder.status_code == 200:
            last_page = int(
                Helpers.Regex(
                    pages_finder.headers['Link'],
                    r'.*page=(.*)>.*',
                    return_data=True,
                    rematch=True).match()[
                        -1])

            current_page = 1

            print("Getting the list of input sources", end=" ")

            while current_page <= last_page:
                params = {
                    'page': str(current_page)
                }

                req = get(url_to_get, params=params, auth=('mitchellkrogza', environ['GH_TOKEN']))

                if req.status_code == 200:
                    for repo in req.json():
                        name = repo['name']
                        if name not in Settings.repo_to_ignore:
                            Settings.repositories.append(name)
                else:
                    print(Settings.error)
                    raise Exception(
                        'Impossible to get information about the organisation. Is GitHub down ? (%s)' %
                        req.status_code)

                current_page += 1

            Settings.repositories = Helpers.List(
                Settings.repositories).format()
            print(Settings.done)
        else:
            raise Exception(
                'Impossible to get the numbers of page to read. Is GitHub down ? (%s) (%s/%s %s)' %
                (pages_finder.status_code,
                 pages_finder.headers['X-RateLimit-Remaining'],
                 pages_finder.headers['X-RateLimit-Limit'],
                 pages_finder.headers['X-RateLimit-Reset']))

    @classmethod
    def _data_parser(cls, line):
        """
        Given the extracted line, this method append the data
        to its final location.

        Argument:
            - line: str
                The extracted line.
        """

        if line and not line.startswith('#'):
            if Helpers.Regex(
                    line,
                    Settings.regex_ip4,
                    return_data=False).match() and cls._cleaning_domain_or_ip(line):
                Settings.ips.append(line)
            elif Helpers.Regex(line, Settings.regex_domain, return_data=False).match() and cls._cleaning_domain_or_ip(line):
                Settings.domains.append(line)

    @classmethod
    def _cleaning_domain_or_ip(cls, domain_or_ip):
        """
        This method will check if the domain match once of our whitelisted.

        Arguments:
            - domain_or_ip: str
                A domain or ip to check presence into the whitelist list.
        """

        for whitelisted in Settings.whitelist:
            if whitelisted.startswith(Settings.whitelist_all_marker):
                regex = escape(
                    whitelisted.split(Settings.whitelist_all_marker)[1]) + '$'
            else:
                regex = '^%s$' % escape(whitelisted)

            if Helpers.Regex(
                    domain_or_ip,
                    regex,
                    return_data=False).match():
                return ""
        return domain_or_ip

    def data_extractor(self, repo=None):
        """
        This method will read all domains.list or clean.list and append each
        domain to Settings.domains and each IP to Settings.ips.
        """

        if not repo:
            list(map(self.data_extractor,Settings.repositories))
        else:
            domains_url = (Settings.raw_link + 'domains.list') % repo
            clean_url = (Settings.raw_link + 'clean.list') % repo

            clean_url_data = get(clean_url)
            domains_url_data = get(domains_url)

            if clean_url_data.status_code == 200:
                print("Extracting domains and ips from %s (clean.list)" % repo, end=" ")

                data = clean_url_data
            elif domains_url_data.status_code == 200:
                print("Extracting domains and ips from %s (domain.list)" % repo, end=" ")

                data = domains_url_data
            else:
                print(Settings.error)
                data = ""

            if data:
                list(map(self._data_parser, data.text.split('\n')))

                Settings.domains = Helpers.List(Settings.domains).format()
                Settings.ips = Helpers.List(Settings.ips).format()
                print(Settings.done)

#
#
# class Generate(object):
#     """
#     This class generate what we need.
#     """
#
#     def __init__(self):
#         print("\n")
#         self.dotted_format()
#         self.plain_text_domain_format()
#         self.plain_text_ips_format()
#         self.hosts_deny_format()
#         self.super_hosts_deny_format()
#         self.hosts_windows_format()
#         self.hosts_unix_format()
#         self.readme_md()
#         print("\n")
#
#     @classmethod
#     def dotted_format(cls):
#         """
#         This method will generate the dotted domains file.
#         """
#
#         data_to_write = '.' + '\n.'.join(Settings.domains)
#
#         print("Generation of %s" % Settings.dotted_file, end=" ")
#         Helpers.File(Settings.dotted_file).write(data_to_write, overwrite=True)
#         print(Settings.done)
#
#     @classmethod
#     def plain_text_domain_format(cls):
#         """
#         This method will generate the file with only plain domain.
#         """
#
#         data_to_write = '\n'.join(Settings.domains)
#
#         print("Generation of %s" % Settings.plain_text_domains_file, end=" ")
#         Helpers.File(
#             Settings.plain_text_domains_file).write(
#                 data_to_write, overwrite=True)
#         print(Settings.done)
#
#     @classmethod
#     def plain_text_ips_format(cls):
#         """
#         This method will generate the file with only plain domain.
#         """
#
#         data_to_write = '\n'.join(Settings.ips)
#
#         print("Generation of %s" % Settings.plain_text_ips_file, end=" ")
#         Helpers.File(
#             Settings.plain_text_ips_file).write(
#                 data_to_write, overwrite=True)
#         print(Settings.done)
#
#     @classmethod
#     def hosts_deny_format(cls):
#         """
#         This method will generate the file in hosts.deny format.
#         """
#
#         template = Helpers.File(Settings.hosts_deny_template).read()
#
#         template = Helpers.Regex(
#             template,
#             r'%%version%%',
#             replace_with=Settings.version).replace()
#         template = Helpers.Regex(template, r'%%lenIP%%', replace_with=format(
#             len(Settings.ips), ',d')).replace()
#
#         data_to_write = 'ALL: ' + '\nALL: '.join(Settings.ips)
#
#         template = Helpers.Regex(
#             template,
#             r'%%content%%',
#             replace_with=data_to_write).replace()
#
#         print("Generation of %s" % Settings.hosts_deny_file, end=" ")
#         Helpers.File(
#             Settings.hosts_deny_file).write(
#                 template,
#                 overwrite=True)
#         print(Settings.done)
#
#     @classmethod
#     def super_hosts_deny_format(cls):
#         """
#         This method will generate the file in superhosts.deny format.
#         """
#
#         template = Helpers.File(Settings.superhosts_deny_template).read()
#
#         template = Helpers.Regex(
#             template,
#             r'%%version%%',
#             replace_with=Settings.version).replace()
#         template = Helpers.Regex(template, r'%%lenIPHosts%%', replace_with=format(
#             len(Settings.ips) + len(Settings.domains), ',d')).replace()
#
#         hosts_ip = Settings.ips + Settings.domains
#         hosts_ip = Helpers.List(hosts_ip).format()
#
#         data_to_write = 'ALL: ' + '\nALL: '.join(hosts_ip)
#
#         template = Helpers.Regex(
#             template,
#             r'%%content%%',
#             replace_with=data_to_write).replace()
#
#         print("Generation of %s" % Settings.superhosts_deny_file, end=" ")
#         Helpers.File(
#             Settings.superhosts_deny_file).write(
#                 template,
#                 overwrite=True)
#         print(Settings.done)
#
#     @classmethod
#     def hosts_windows_format(cls):
#         """
#         This method will generate the file in hosts.windows format.
#         """
#
#         template = Helpers.File(Settings.hosts_windows_template).read()
#
#         template = Helpers.Regex(
#             template,
#             r'%%version%%',
#             replace_with=Settings.version).replace()
#         template = Helpers.Regex(template, r'%%lenHosts%%', replace_with=format(
#             len(Settings.domains), ',d')).replace()
#
#         data_to_write = '127.0.0.1 ' + '\n127.0.0.1 '.join(Settings.domains)
#
#         template = Helpers.Regex(
#             template,
#             r'%%content%%',
#             replace_with=data_to_write).replace()
#
#         print("Generation of %s" % Settings.hosts_windows_file, end=" ")
#         Helpers.File(
#             Settings.hosts_windows_file).write(
#                 template,
#                 overwrite=True)
#         print(Settings.done)
#
#     @classmethod
#     def hosts_unix_format(cls):
#         """
#         This method will generate the file in hosts format.
#         """
#
#         template = Helpers.File(Settings.hosts_unix_template).read()
#
#         template = Helpers.Regex(
#             template,
#             r'%%version%%',
#             replace_with=Settings.version).replace()
#         template = Helpers.Regex(template, r'%%lenHosts%%', replace_with=format(
#             len(Settings.domains), ',d')).replace()
#
#         data_to_write = '0.0.0.0 ' + '\n0.0.0.0 '.join(Settings.domains)
#
#         template = Helpers.Regex(
#             template,
#             r'%%content%%',
#             replace_with=data_to_write).replace()
#
#         print("Generation of %s" % Settings.hosts_unix_file, end=" ")
#         Helpers.File(
#             Settings.hosts_unix_file).write(
#                 template,
#                 overwrite=True)
#         print(Settings.done)
#
#     @classmethod
#     def readme_md(cls):
#         """
#         This methos will generate the REAMDE.md.
#         """
#
#         template = Helpers.File(Settings.readme_me_template).read()
#
#         template = Helpers.Regex(
#             template,
#             r'%%version%%',
#             replace_with=Settings.version).replace()
#         template = Helpers.Regex(template, r'%%lenHosts%%', replace_with=format(
#             len(Settings.domains), ',d')).replace()
#         template = Helpers.Regex(template, r'%%lenIPs%%', replace_with=format(
#             len(Settings.ips), ',d')).replace()
#         template = Helpers.Regex(template, r'%%lenHostsIPs%%', replace_with=format(
#             len(Settings.ips) + len(Settings.domains), ',d')).replace()
#
#         print("Generation of %s" % Settings.readme_md_file, end=" ")
#         Helpers.File(
#             Settings.readme_md_file).write(
#                 template,
#                 overwrite=True)
#         print(Settings.done)
#
#
# class Compress(object):  # pylint: disable=too-few-public-methods
#     """
#     This class run and manage the compression
#     """
#
#     def __init__(self):
#         to_compresss = [
#             Settings.dotted_file,
#             Settings.plain_text_domains_file,
#             Settings.plain_text_ips_file,
#             Settings.hosts_deny_file,
#             Settings.superhosts_deny_file,
#             Settings.hosts_windows_file,
#             Settings.hosts_unix_file
#         ]
#
#         for file in to_compresss:
#             compress_into_zip = '%s.zip' % file
#             compress_into_tar_gz = '%s.tar.gz' % file
#
#             print("\n")
#             print(
#                 "Compression of %s into %s" %
#                 (file, compress_into_zip), end=" ")
#             Helpers.File(file).zip_compress(compress_into_zip)
#             print(Settings.done)
#
#             print(
#                 "Compression of %s into %s" %
#                 (file, compress_into_tar_gz), end=" ")
#             Helpers.File(file).tar_gz_compress(compress_into_tar_gz)
#             print(Settings.done)
#
#             print("Deletion of %s" % file, end=" ")
#             Helpers.File(file).delete()
#             print(Settings.done)
#
#
# class Deploy(object):  # pylint: disable=too-few-public-methods
#     """
#     This class will deploy our files to upstream.
#     """
#
#     def __init__(self):
#         commit_message = '%s [ci skip]' % Settings.version
#
#         Helpers.travis_permissions()
#
#         Helpers.Command(
#             "git add --all && git commit -a -m '%s' && git push origin %s" %
#             (commit_message, environ['GIT_BRANCH'])).execute()
#
#         get(Settings.deploy_raw_url)
#
#


class Helpers(object):  # pylint: disable=too-few-public-methods
    """
    Well, thanks to those helpers :-)
    """

    @classmethod
    def travis_permissions(cls):
        """
        Set permissions in order to avoid issues before commiting.
        """

        build_dir = environ['TRAVIS_BUILD_DIR']
        commands = [
            'sudo chown -R travis:travis %s' %
            (build_dir),
            'sudo chgrp -R travis %s' %
            (build_dir),
            'sudo chmod -R g+rwX %s' %
            (build_dir),
            'sudo chmod 777 -Rf %s.git' %
            (build_dir +
             directory_separator),
            r"sudo find %s -type d -exec chmod g+x '{}' \;" %
            (build_dir)]

        for command in commands:
            print("Running %s" % repr(command))
            Helpers.Command(command, True).execute()

        if Helpers.Command(
                'git config core.sharedRepository',
                False).execute() == '':
            Helpers.Command(
                'git config core.sharedRepository group',
                False).execute()

    class List(object):  # pylint: disable=too-few-public-methods
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

            try:
                return sorted(list(set(self.main_list)), key=str.lower)
            except TypeError:
                return self.main_list

    class File(object):  # pylint: disable=too-few-public-methods
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

            with open(self.file, 'r', encoding="utf-8") as file:
                funilrys = file.read()

            return funilrys

        def write(self, data_to_write, overwrite=False):
            """
            Write or append data into the given file path.

            :param data_to_write: A string, the data to write.
            """

            if data_to_write is not None and isinstance(
                    data_to_write, str):
                if overwrite or not path.isfile(self.file):
                    with open(self.file, 'w', encoding="utf-8") as file:
                        file.write(data_to_write)
                else:
                    with open(self.file, 'a', encoding="utf-8") as file:
                        file.write(data_to_write)

        def zip_compress(self, destination):
            """
            Compress a file into a zip.

            Argument:
                - destination: str
                    The destination of the compressed file.
            """

            if destination is not None and isinstance(destination, str):
                with ZipFile(destination, 'w') as thezip:
                    thezip.write(self.file)

        def tar_gz_compress(self, destination):
            """
            Compress a file into a tar.gz.

            Argument:
                - destination: str
                    The destination of the compressed file.
            """

            if destination is not None and isinstance(destination, str):
                with tarfile_open(destination, 'w:gz') as tar:
                    tar.add(self.file)

        def delete(self):
            """
            Delete a given file path.
            """

            try:
                remove(self.file)
            except OSError:
                pass

    class Regex(object):  # pylint: disable=too-few-public-methods

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
                "return_data": True
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
                        self.group).strip()  # pylint: disable=no-member

                return result
            elif not self.return_data and pre_result is not None:  # pylint: disable=no-member
                return True
            return False

        def replace(self):
            """Used to replace a matched string with another."""

            if self.replace_with is not None:  # pylint: disable=no-member
                return substrings(
                    self.regex,
                    self.replace_with,  # pylint: disable=no-member
                    self.data,
                    self.occurences)  # pylint: disable=no-member
            return self.data

    class Command(object):
        """
        Shell command execution.

        Arguments:
            command: A string, the command to execute.
            allow_stdout: A bool, If true stdout is always printed otherwise stdout
                is passed to PIPE.
        """

        def __init__(self, command, allow_stdout=True):
            self.decode_type = 'utf-8'
            self.command = command
            self.stdout = allow_stdout

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
            """Execute the given command."""

            if not self.stdout:
                process = Popen(
                    self.command,
                    stdout=PIPE,
                    stderr=PIPE,
                    shell=True)
            else:
                process = Popen(self.command, stderr=PIPE, shell=True)

            (output, error) = process.communicate()

            if process.returncode != 0:
                decoded = self.decode_output(error)

                if not decoded:
                    return 'Unkown error. for %s' % (self.command)

                print(decoded)
                exit(1)
            return self.decode_output(output)

    class URL(object):
        """
        This class manage everything about url :)

        Argument:
            - url: A string, the url we are working with.
        """

        def __init__(self, url):
            self.url = url

        def is_valid(self):
            """
            Check if the given domain can be reached or not.
            """

            try:
                get(self.url)
                return True
            except gaierror:
                return False

        def is_404(self):
            """
            Check if the given domain return 404.
            """

            req = get(self.url)

            if self.is_valid() and req.status_code == 404:
                return True
            return False


if __name__ == '__main__':
    print("What's wrong with funilrys ? ")
    Initiate()
#     Generate()
#     Compress()
#     Deploy()
