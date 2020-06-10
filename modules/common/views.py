import logging
from django.shortcuts import render
from modules.common.models import Module_Link, Module

logger = logging.getLogger(__name__)


class Mod_links:
    pass


def get_module_links():
    return Module_Link.objects.all()


def get_sidebar():
    modules = Module.objects.all()
    mm = []

    for module in modules:
        t_mod = {}
        for attr, value in module.__dict__.items():
            if (attr != '_state'): t_mod[attr] = value

        links = Module_Link.objects.filter(module_id=module.id)
        if links:
            t_mod['child'] = []
            for link in links:
                t_mod_links = Mod_links()
                for attr, value in link.__dict__.items():
                    if (attr != '_state'): setattr(t_mod_links, attr, value)
                t_mod['child'].append(t_mod_links)
        else:
            t_mod['child'] = 0

        mm.append(t_mod)

    return mm
