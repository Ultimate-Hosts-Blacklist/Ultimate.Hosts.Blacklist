#!/usr/bin/env python3
# -*- coding: utf-8 -*-

"""
This module has been written in order to maintain a system which
can be used to whitelist whatever file with the Ultimate whitelist list.

Authors:
    - @Funilrys, Nissar Chababy <contactTAfunilrysTODcom>

Contributors:
    Let's contribute !

    @GitHubUsername, Name, Email (optional)
"""
# pylint:disable=bad-continuation
import argparse
from json import loads
from os import path
from re import compile as comp
from re import escape

from colorama import Fore, Style
from colorama import init as initiate
from requests import get


class Settings:  # pylint: disable=too-few-public-methods
    """
    This class will save all data that can called from anywhere in the code.
    """

    # This variable will tell us the whitelist list we have to look at.
    #
    # Note: DO NOT TOUCH UNLESS YOU KNOW WHAT IT MEANS!
    whitelist_permanent_list = "https://raw.githubusercontent.com/Ultimate-Hosts-Blacklist/whitelist/master/domains.list"  # pylint: disable=line-too-long

    # This variable will tell us where we are looking for the Root Zone Database.
    #
    # Note: DO NOT TOUCH UNLESS YOU KNOW WHAT IT MEANS!
    root_zone_database = "https://raw.githubusercontent.com/funilrys/PyFunceble/master/iana-domains-db.json"  # pylint: disable=line-too-long

    # This variable will tell us where we are looking for the Public Suffix Database.
    #
    # Note: DO NOT TOUCH UNLESS YOU KNOW WHAT IT MEANS!
    public_suffix_database = "https://raw.githubusercontent.com/funilrys/PyFunceble/master/public-suffix.json"  # pylint: disable=line-too-long

    # This variable will save all elements from our whitelist list.
    #
    # Note: DO NOT TOUCH UNLESS YOU KNOW WHAT IT MEANS!
    whitelist = []

    # This variable is used to set the marker that we use to say that we
    # match all occurence of the domain or IP.
    #
    # Note: DO NOT TOUCH UNLESS YOU KNOW WHAT IT MEANS!
    whitelist_all_marker = "ALL "

    # This variable is used to set the marker that will allow a more permissive
    # regex check.
    #
    # Note: DO NOT TOUCH UNLESS YOU KNOW WHAT IT MEANS!
    whitelist_full_regex_marker = "REG "

    # This variable is used to set the marker that we use to say that we match
    # the given line + all possible Root Zone Database.
    #
    # Note: DO NOT TOUCH UNLESS YOU KNOW WHAT IT MEANS!
    whitelist_rzd_marker = "RZD "

    # This variable save the list of all whitelisted domain in regex format.
    #
    # Note: DO NOT TOUCH UNLESS YOU KNOW WHAT IT MEANS!
    # Note: This variable is auto updated by Whitelist()
    regex_whitelist = ""

    # This variable is used to know if we are allowed to use the official
    # Ultimate Hosts Blacklist whitelist list.
    #
    # Note: DO NOT TOUCH UNLESS YOU KNOW WHAT IT MEANS!
    without_core = False

    # This variable save the list of all Root Zone Database.
    #
    # Note: DO NOT TOUCH UNLESS YOU KNOW WHAT IT MEANS!
    # Note: This variable is auto updated by Whitelist()
    rzd_regex = ""


class Whitelist:
    """
    This class will initiate and execute our logic.

    Arguments:
        - file: str
            A path to a file to read and to whitelist.
        - string: str
            A string of `\n` separated element to whitelist.
        - output: str
            A path to a file we have to write our non whitelisted content to.
        - secondary_whitelist: list
            List of `open()` instances. Those `open()` instances should link to
            a whitelist file to apply to the current process/session.
    """

    def __init__(self, file=None, string=None, output=None, secondary_whitelist=None):
        self.secondary_whitelist_file = secondary_whitelist

        rzd_db = [
            tdl
            for tdl in loads(
                Helpers.Download(Settings.root_zone_database, destination=None).link()
            ).keys()
        ]

        rzd_db.extend(
            [
                suffix
                for suffixes in loads(
                    Helpers.Download(
                        Settings.public_suffix_database, destination=None
                    ).link()
                ).values()
                for suffix in suffixes
            ]
        )

        Settings.rzd_regex = r"((?:\.(?:{})))".format(
            "|".join(list(map(escape, rzd_db)))
        )

        self.file = file
        self.output_file = output
        self.get_whitelist()
        self.string = string

    def get(self):  # pylint:disable=inconsistent-return-statements
        """
        This method will put everything together!
        """

        content = []

        if self.file:
            content.extend(
                list(map(self._format_line, Helpers.File(self.file).to_list()))
            )
        elif self.string:
            content.extend(list(map(self._format_line, self.string.split("\n"))))

        if content:
            if self.output_file:
                Helpers.File(self.output_file).write("", overwrite=True)

            printed_or_written = self._print_or_write(
                Helpers.Regex(
                    content, Settings.regex_whitelist, return_data=False
                ).not_matching_list()
            )

            if __name__ != "__main__":
                return printed_or_written

    def _print_or_write(self, line):
        """
        This method will print on screen or write to the output file.
        """

        if isinstance(line, list):
            line = "\n".join(line)

        if self.output_file:
            Helpers.File(self.output_file).write(line + "\n", overwrite=False)
            return None

        if __name__ == "__main__":
            print(line)
            return None

        return line

    @classmethod
    def _format_line(cls, line):  # pylint: disable=too-many-branches
        """
        This method will format the given line.

        Argument:
            - line: str
                The line we are currently reading.
        """

        if line.startswith("#"):
            return line

        regex_delete = r"localhost$|localdomain$|local$|broadcasthost$|0\.0\.0\.0$|allhosts$|allnodes$|allrouters$|localnet$|loopback$|mcastprefix$"  # pylint: disable=line-too-long
        comment = ""
        element = ""
        tabs = "\t"
        space = " "

        if Helpers.Regex(line, regex_delete, return_data=True).match():
            return line

        tabs_position, space_position = (line.find(tabs), line.find(space))

        if tabs_position > -1 and space_position > -1:
            if space_position < tabs_position:
                separator = space
            else:
                separator = tabs
        elif not tabs_position == -1:
            separator = tabs
        elif not space_position == -1:
            separator = space
        else:
            separator = ""

        if separator:
            splited_line = line.split(separator)

            index = 0
            while index < len(splited_line):
                if (
                    splited_line[index]
                    and not Helpers.Regex(
                        splited_line[index], regex_delete, return_data=False
                    ).match()
                ):
                    break
                index += 1

            if "#" in splited_line[index]:
                index_comment = splited_line[index].find("#")

                if index_comment > -1:
                    comment = splited_line[index][index_comment:]

                    element = (
                        splited_line[index]
                        .split(comment)[0]
                        .encode("IDNA")
                        .decode("UTF-8")
                    )
                    splited_line[index] = element + comment

                    return (element, separator.join(splited_line))

            element = splited_line[index].encode("IDNA").decode("UTF-8")

            return (element, separator.join(splited_line))
        return line.encode("IDNA").decode("UTF-8")

    @classmethod
    def whitelist_parser(cls, line):
        """
        This method will get and parse our whitelist elements into Settings.whitelist.

        Argument:
            - line: str
                The extracted line.
        """

        if line and not line.startswith("#"):
            if line.startswith(Settings.whitelist_all_marker):
                whitelist_element = "{}$".format(
                    escape(line.split(Settings.whitelist_all_marker)[-1].strip())
                )
            elif line.startswith(Settings.whitelist_full_regex_marker):
                whitelist_element = "{}".format(
                    line.split(Settings.whitelist_full_regex_marker)[-1].strip()
                )
            elif line.startswith(Settings.whitelist_rzd_marker):
                to_check = line.split(Settings.whitelist_rzd_marker)[-1].strip()

                if to_check.endswith("."):
                    to_check = to_check[:-1]

                to_check = escape(to_check)

                if not to_check.startswith("www."):
                    whitelist_element = [
                        "^{}{}$".format(to_check, Settings.rzd_regex),
                        "^www.{}{}$".format(to_check, Settings.rzd_regex),
                    ]
                else:
                    whitelist_element = [
                        "^{}{}$".format(to_check, Settings.rzd_regex),
                        "^{}{}$".format(
                            ".".join(to_check.split(".")[1:]), Settings.rzd_regex
                        ),
                    ]
            else:
                to_check = escape(line.strip())

                if not to_check.startswith("www."):
                    whitelist_element = [
                        "^{}$".format(to_check),
                        "^www.{}$".format(to_check),
                    ]
                else:
                    whitelist_element = [
                        "^{}$".format(to_check),
                        "^{}$".format(".".join(to_check.split(".")[1:])),
                    ]

            if isinstance(whitelist_element, list):
                Settings.whitelist.extend(whitelist_element)
            else:
                Settings.whitelist.append(whitelist_element)

    def get_whitelist(self):
        """
        This method will get the list of whitelisted domain.
        """

        if not Settings.without_core:
            data = (
                Helpers.Download(Settings.whitelist_permanent_list, None)
                .link()
                .split("\n")
            )
        else:
            data = []

        if self.secondary_whitelist_file and isinstance(
            self.secondary_whitelist_file, list
        ):
            for file in self.secondary_whitelist_file:
                data.extend(file.read().splitlines())

        if data:
            list(map(self.whitelist_parser, Helpers.List(data).format()))

            Settings.regex_whitelist = "|".join(Settings.whitelist)


class Helpers:  # pylint: disable=too-few-public-methods
    """
    Well thanks to those helpers I wrote :)
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

            try:
                return sorted(list(set(self.main_list)), key=str.lower)

            except TypeError:
                return self.main_list

    class File:  # pylint: disable=too-few-public-methods
        """
        File treatment/manipulations.

        Argument:
            - file: str
                - a path to the file to manipulate.
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

        def to_list(self):
            """
            Read a file path and return each line as a list element.
            """

            result = []

            for read in open(self.file, encoding="utf-8"):
                result.append(read.rstrip("\n").strip())

            return result

        def write(self, data_to_write, overwrite=False):
            """
            Write or append data into the given file path.

            Argument:
                - data_to_write: str
                    The data to write.
            """

            if data_to_write is not None and isinstance(data_to_write, str):
                if overwrite or not path.isfile(self.file):
                    with open(self.file, "w", encoding="utf-8") as file:
                        file.write(data_to_write)
                else:
                    with open(self.file, "a", encoding="utf-8") as file:
                        file.write(data_to_write)

    class Download:  # pylint: disable=too-few-public-methods
        """
        This class will initiate a download of the desired link.

        Arguments:
            - link_to_download: str
                The link to the file we are going to download.
            - destination: str
                The destination of the downloaded data.
        """

        def __init__(self, link_to_download, destination, convert_to_idna=False):
            self.link_to_download = link_to_download
            self.destination = destination
            self.convert_to_idna = convert_to_idna

        def _convert_to_idna(self, data):
            """
            This method convert a given data into IDNA format.

            Argument:
                - data: str
                    The downloaded data.
            """

            if self.convert_to_idna:
                to_write = []

                for line in data.split("\n"):
                    line = line.split()
                    try:
                        if isinstance(line, list):
                            converted = []
                            for string in line:
                                converted.append(string.encode("idna").decode("utf-8"))

                            to_write.append(" ".join(converted))
                        else:
                            to_write.append(line.encode("idna").decode("utf-8"))
                    except UnicodeError:
                        if isinstance(line, list):
                            to_write.append(" ".join(line))
                        else:
                            to_write.append(line)
                return to_write

            return None

        def link(self):
            """
            This method initiate the download.
            """

            if self.link_to_download:
                request = get(self.link_to_download)

                if request.status_code == 200:
                    if self.destination:
                        if self.convert_to_idna:
                            Helpers.File(self.destination).write(
                                "\n".join(self._convert_to_idna(request.text)),
                                overwrite=True,
                            )
                        else:
                            Helpers.File(self.destination).write(
                                request.text, overwrite=True
                            )
                    else:
                        return request.text

                    del request

                    return True

            return False

    class Regex:  # pylint: disable=too-few-public-methods

        """A simple implementation ot the python.re package

        Arguments:
            - data: str
                The data to regex check.
            - regex: str
                The regex to match.
            - group: int
                The group to return
            - rematch: bool
                True: return the matched groups into a formated list.
                    (implementation of Bash ${BASH_REMATCH})
            - replace_with: str
                The value to replace the matched regex with.
            - occurences: int
                The number of occurence(s) to replace.
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
            """
            Used to get exploitable result of re.search
            """

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

            if self.return_data and pre_result:  # pylint: disable=no-member
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

            elif not self.return_data and pre_result:  # pylint: disable=no-member
                return True

            return False

        def not_matching_list(self):
            """
            This method return a list of string which don't match the
            given regex.
            """

            pre_result = comp(self.regex)

            return list(
                filter(lambda element: not pre_result.search(str(element)), self.data)
            )

        def matching_list(self):
            """
            This method return a list of the string which match the given
            regex.
            """

            pre_result = comp(self.regex)

            return list(
                filter(lambda element: pre_result.search(str(element)), self.data)
            )


if __name__ == "__main__":
    initiate(autoreset=True)

    PARSER = argparse.ArgumentParser(
        description="The tool to whitelist a list or a hosts file with the Ultimate Hosts Blacklist infrastructure.",  # pylint: disable=line-too-long
        epilog="Crafted with %s by %s"
        % (
            Fore.RED + "♥" + Fore.RESET,
            Style.BRIGHT + Fore.CYAN + "Nissar Chababy (Funilrys) " + Style.RESET_ALL,
        ),
    )

    PARSER.add_argument(
        "-f",
        "--file",
        type=str,
        help="Read the given file and remove all element to whitelist.",
    )

    PARSER.add_argument(
        "-w",
        "--whitelist",
        type=argparse.FileType("r"),
        nargs="+",
        help="Read the given file and append its data to the our whitelist list.",
    )

    PARSER.add_argument(
        "-wc",
        "--without-core",
        action="store_true",
        help="Disable the usage of the Ultimate Hosts Blacklist whitelist list.",
    )

    PARSER.add_argument(
        "-o",
        "--output",
        type=str,
        help="Save the result to the given filename or path.",
    )

    ARGS = PARSER.parse_args()

    if ARGS.without_core:
        Settings.without_core = ARGS.without_core

    Whitelist(
        file=ARGS.file, output=ARGS.output, secondary_whitelist=ARGS.whitelist
    ).get()
