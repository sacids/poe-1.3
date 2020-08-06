from modeltranslation.translator import translator, TranslationOptions
from .models import *


class SymptomTranslationOptions(TranslationOptions):
    fields = ('title', 'title_sw')


translator.register(Symptom, SymptomTranslationOptions)
