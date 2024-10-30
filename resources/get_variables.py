import re


def get_variables_from_file(filename: str) -> dict:
    """
    Get variables from the file and return them in dictionary.
    Parses string patterns like "TARGET_FRONTEND_IP": "10.78.185.23"
    """
    lines = []
    with open(filename, mode="r", encoding="utf-8") as f:
        lines = f.readlines()
        lines = [line.strip("\n") for line in lines]
        vars = {}
        reg = re.compile('\s*"([\w\s\d_-]*)":\s*(["\w\s\d/\.:_-]*)')
        for line in lines:
            matches = re.match(reg, line)
            if matches:
                vars[matches.group(1)] = (
                    matches.group(2)
                    if " " in matches.group(2)
                    else matches.group(2).replace('"', "")
                )

    return vars
