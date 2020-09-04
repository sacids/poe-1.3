from modeltranslation.translator import translator, TranslationOptions
from .models import *


class SymptomTranslationOptions(TranslationOptions):
    fields = ('title',)

translator.register(Symptom, SymptomTranslationOptions)
