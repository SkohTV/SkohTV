"""
Export json data to markdown file
"""
import json, os

text = ""

jsonFile = "_websites/websites.json"
markdownFile = "_websites/README.md"


folderStart = "<details><summary>"
folderEnd = "</summary><ul>"
folderClose = "</ul></details>"

fileStart = "ㅤ<a href='"
fileNext = "'>"
fileFollow = "</a> - <span>"
fileClose = "</span><br>"

tab = "    "
startMD = """# Websites Ressources<br>

Repertory of useful websites and ressources<br>
Raw data is in `.json` file, and is exported to markdown with `.py` file<br>

__If you want to add some websites__<br>
\- Fork the repo<br>
\- Add the websites + description in `.json` in "Unsorted"<br>
\- Create pull request<br>

---

"""


def bump(data, level=0) -> str:
    global text

    if type(data) == dict:
        for i in data:

            if type(data[i]) == dict:
                text += f"{tab * level}{folderStart}{i}{folderEnd}\n"
                bump(data[i], level+1)
                text += f"{tab * level}{folderClose}\n"

            else:
                text += f"{tab * level}{fileStart}{i}{fileNext}{i}{fileFollow}{data[i]}{fileClose}\n"




with open(jsonFile, 'r', encoding="utf-8") as f:
    json_data = json.load(f)

with open(markdownFile, 'w', encoding="utf-8") as f:
    f.write(startMD)

with open(markdownFile, 'a', encoding="utf-8") as f:
    bump(json_data)
    f.write(text)

print("Done !")