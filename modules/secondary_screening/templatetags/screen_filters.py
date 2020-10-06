from django import template

register = template.Library()


@register.filter(name='get_answer')
def get_answer(array, key):
    if key in array:
        return array[key]
    return False


@register.filter(name='zget_id')
def zget_id(array):
    if 'id' in array:
        return array['id']
    return False
