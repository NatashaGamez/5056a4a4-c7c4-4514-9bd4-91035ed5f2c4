import logging

import json
import requests

from bs4 import BeautifulSoup

logger = logging.getLogger(__name__)
<<<<<<< HEAD

class AbstractIndustry(object):
    def __init__(self,title, children):
        logger.info("Creating industry: {title}".format(title=title))
        self.title = title
        self.children = children

    @property
    def level(self):
        raise NotImplementedError("Abstract Industry doesn't contains level")

    def add_child(self, child):
        self.children.append(child)

    def to_dict(self):
        return {
            "title": self.title,
            "childre": [
                child.to_dict() for child in self.children
            ]
        }

    def jsonify(self):
        return json.dump(self.to_dict())

class Division(AbstractIndustry):
    level = "SIC Division"

class MayorGroup(AbstractIndustry):
    level = "SIC Mayor Group"

    @staticmethod
    def from_url(url):
        response = requests.get(url)
        html = BeautifulSoup(response.text,'html.parser')
        return MayorGroup(
            title=[
                elm.text for elm in html.find_all("h2") if elm.text.lower().startswith("major group")
            ][0],
            children=[
                Group(
                    title=group.text,
                    children=[
                        Single(
                            title=inner.parent.text,
                            children=[]
                        )
                        for inner in html.fins_all("a")
                        if inner.attrs.get("href","").startswith("sic_manual")
                        and inner.parent.text.startswith(group.text.split(":")[0].split(" ")[-1])
                          ])
                for group in html.find_all("strong") if group.text.lower().startswith("industry group")
            ]
        )


class Group(AbstractIndustry):
    level = "SIC Group"


class Single(AbstractIndustry):
    level = "SIC Industry"


class SIC(AbstractIndustry):
    level = "Standar Industry Classification"

    @staticmethod
    def load_json(filename):
        with open(filename, "r") as file:
            sic_industries = json.loads(file.read)
        return sic_industries

    @staticmethod
    def from_url(url):
        response = requests.get(url)
        html = BeautifulSoup(response.text, 'html.parser')
        divisions = []
        for element in html.find_all("a"):
            href = element.attrs.get("href","")
            title =  element.attrs.get("href", "")
            if not href.startswith("sic_manual"):
                continue
            elif href.endswith("division"):
                divisions.append(Division(title=title,children=[]))
            elif href.endswith("group"):
                major_group_url = url.replace("sic_manual.html", href)
                divisions[-1].add_child(MayorGroup.from_url(major_group_url))
        return SIC(
            title="SIC",
            children=divisions
        )

=======

class AbstractIndustry(object):
    def __init__(self,title, children):
        logger.info("Creating industry: {title}".format(title=title))
        self.title = title
        self.children = children

    @property
    def level(self):
        raise NotImplementedError("Abstract Industry doesn't contains level")

    def add_child(self, child):
        self.children.append(child)

    def to_dict(self):
        return {
            "title": self.title,
            "childre": [
                child.to_dict() for child in self.children
            ]
        }

    def jsonify(self):
        return json.dump(self.to_dict())

class Division(AbstractIndustry):
    level = "SIC Division"

class MayorGroup(AbstractIndustry):
    level = "SIC Mayor Group"

    @staticmethod
    def from_url(url):
        response = requests.get(url)
        html = BeautifulSoup(response.text,'html.parser')
        return MayorGroup(
            title=[
                elm.text for elm in html.find_all("h2") if elm.text.lower().startswith("major group")
            ][0],
            children=[
                Group(
                    title=group.text,
                    children=[
                        Single(
                            title=inner.parent.text,
                            children=[]
                        )
                        for inner in html.fins_all("a")
                        if inner.attrs.get("href","").startswith("sic_manual")
                        and inner.parent.text.startswith(group.text.split(":")[0].split(" ")[-1])
                          ])
                for group in html.find_all("strong") if group.text.lower().startswith("industry group")
            ]
        )


class Group(AbstractIndustry):
    level = "SIC Group"


class Single(AbstractIndustry):
    level = "SIC Industry"


class SIC(AbstractIndustry):
    level = "Standar Industry Classification"

    @staticmethod
    def load_json(filename):
        with open(filename, "r") as file:
            sic_industries = json.loads(file.read)
        return sic_industries

    @staticmethod
    def from_url(url):
        response = requests.get(url)
        html = BeautifulSoup(response.text, 'html.parser')
        divisions = []
        for element in html.find_all("a"):
            href = element.attrs.get("href","")
            title =  element.attrs.get("href", "")
            if not href.startswith("sic_manual"):
                continue
            elif href.endswith("division"):
                divisions.append(Division(title=title,children=[]))
            elif href.endswith("group"):
                major_group_url = url.replace("sic_manual.html", href)
                divisions[-1].add_child(MayorGroup.from_url(major_group_url))
        return SIC(
            title="SIC",
            children=divisions
        )
>>>>>>> master
