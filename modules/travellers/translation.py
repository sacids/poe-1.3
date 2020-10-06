from modeltranslation.translator import translator, TranslationOptions
from .models import Symptom


class SymptomTranslationOptions(TranslationOptions):
    fields = ('title',)


translator.register(Symptom, SymptomTranslationOptions)
