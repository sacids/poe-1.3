from django import template
import json

register    = template.Library()

@register.filter(name='replace_underscore')
def replace_underscore(string):
    return string.replace('_', ' ')


