import lxml.html
import requests
import string

headers = {
    "User-Agent": "Mozilla/5.0 (X11; Fedora; Linux x86_64; rv:64.0) Gecko/20100101 Firefox/64.0"
}
base = "https://ctftime.org/"
scoreboard_url = "https://ctftime.org/stats/{}?page={}"


def get_score(link):
    url = base + link
    content = requests.get(url, headers=headers).content
    html = lxml.html.fromstring(content)

    name = html.xpath('//div[@class="page-header"]/h2')[0].text_content()
    name = filter(lambda x: x in string.printable, name)
    table = html.xpath('//div[@id="rating_2019"]/table[@class="table table-striped"]')[0]

    score = 0.0
    rows = table.xpath('.//tr')
    for row in rows:
        try:
            col = row.xpath('.//td')[4].text_content()
            score += float(col)
        except:
            pass

    print ("[INFO] Calculated {}:{}".format(name, score))
    return (name, score)

def get_scoreboard_page(year, page):
    url = scoreboard_url.format(year, page)
    content = requests.get(url, headers=headers).content
    html = lxml.html.fromstring(content)

    table = html.xpath('//table[@class="table table-striped"]')[0]
    rows = table.xpath('.//tr')

    links = []
    for row in rows:
        try:
            col = row.xpath('.//td')[1]
            link = col.xpath('.//a')[0].get('href')
            links.append(link)
        except:
            pass

    scores = {}
    for link in links:
        try:
            obj = get_score(link)
            scores[obj[0]] = obj[1]
        except:
            pass

    return scores

def get_scores(pages):
    scores = {}
    for i in range(1, pages + 1):
        print ("[INFO] Reading page {}...".format(i))
        s = get_scoreboard_page(2019, i)
        for k in s.keys():
            scores[k] = s[k]

    scores = sorted(scores.items(), key=lambda kv: kv[1])
    return scores

LOAD = False
if LOAD:
    with open('scoreboard.dict', 'r') as f:
        data = f.read().strip()
    scores = eval(data)

else:
    scores = get_scores(5)
print ("--- SCOREBOARD ---")
i = len(scores)
for k in scores:
    print ("{} | {} | {}".format(i, k[0], k[1]))
    i -= 1

with open('scoreboard.dict', 'w') as f:
    f.write(str(scores))
