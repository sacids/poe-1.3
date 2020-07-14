from django import template
from datetime import date, timedelta

register = template.Library()

@register.filter(name='get_answer')
def get_answer(array,key):
    if key in array:
        return array[key]
    return False
