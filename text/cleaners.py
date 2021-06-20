""" from https://github.com/keithito/tacotron """

'''
Cleaners are transformations that run over the input text at both training and eval time.

Cleaners can be selected by passing a comma-delimited list of cleaner names as the "cleaners"
hyperparameter. Some cleaners are English-specific. You'll typically want to use:
  1. "english_cleaners" for English text
  2. "transliteration_cleaners" for non-English text that can be transliterated to ASCII using
     the Unidecode library (https://pypi.python.org/pypi/Unidecode)
  3. "basic_cleaners" if you do not want to transliterate (in this case, you should also update
     the symbols in symbols.py to match your data).
'''


# Regular expression matching whitespace:
import re
from unidecode import unidecode
from .numbers import normalize_numbers
_whitespace_re = re.compile(r'\s+')

# List of (regular expression, replacement) pairs for abbreviations:
_abbreviations = [(re.compile('\\b%s\\.' % x[0], re.IGNORECASE), x[1]) for x in [
    ('mrs', 'misess'),
    ('mr', 'mister'),
    ('dr', 'doctor'),
    ('st', 'saint'),
    ('co', 'company'),
    ('jr', 'junior'),
    ('maj', 'major'),
    ('gen', 'general'),
    ('drs', 'doctors'),
    ('rev', 'reverend'),
    ('lt', 'lieutenant'),
    ('hon', 'honorable'),
    ('sgt', 'sergeant'),
    ('capt', 'captain'),
    ('esq', 'esquire'),
    ('ltd', 'limited'),
    ('col', 'colonel'),
    ('ft', 'fort'),
]]


def expand_abbreviations(text):
    for regex, replacement in _abbreviations:
        text = re.sub(regex, replacement, text)
    return text


def expand_numbers(text):
    return normalize_numbers(text)


def lowercase(text):
    return text.lower()


def collapse_whitespace(text):
    return re.sub(_whitespace_re, ' ', text)


def convert_to_ascii(text):
    return unidecode(text)


def basic_cleaners(text):
    '''Basic pipeline that lowercases and collapses whitespace without transliteration.'''
    text = lowercase(text)
    text = collapse_whitespace(text)
    return text


def transliteration_cleaners(text):
    '''Pipeline for non-English text that transliterates to ASCII.'''
    text = convert_to_ascii(text)
    text = lowercase(text)
    text = collapse_whitespace(text)
    return text


def normalise_unicode(text):
    text = re.sub(r"אַ", r"אַ", text)
    text = re.sub(r"אָ", r"אָ", text)
    text = re.sub(r"בּ", r"בּ", text)
    text = re.sub(r"בֿ", r"בֿ", text)
    text = re.sub(r"וּ", r"וּ", text)
    text = re.sub(r"יִ", r"יִ", text)
    text = re.sub(r"ײַ", r"ײַ", text)
    text = re.sub(r"כּ", r"כּ", text)
    text = re.sub(r"פּ", r"פּ", text)
    text = re.sub(r"פֿ", r"פֿ", text)
    text = re.sub(r"שׂ", r"שׂ", text)
    text = re.sub(r"תּ", r"תּ", text)
    text = re.sub(r"-", r"־", text)
    return text


def depoint(text):
    text = re.sub(r"[אַאָ]", r"א", text)
    text = re.sub(r"[בּבֿ]", r"ב", text)
    text = re.sub(r"[פּפֿ]", r"פ", text)
    text = re.sub(r"כּ", r"כ", text)
    text = re.sub(r"תּ", r"ת", text)
    text = re.sub(r"שׂ", r"ש", text)
    text = re.sub(r"", r"ש", text)
    text = re.sub(r"וּ", r"ו", text)
    text = re.sub(r"יִ", r"י", text)
    text = re.sub(r"ײַ", r"יי", text)
    text = re.sub(r"ײ", r"יי", text)
    text = re.sub(r"װ", r"וו", text)
    text = re.sub(r"ױ", r"וי", text)
    return text


def english_cleaners(text):
    '''Pipeline for English text, including number and abbreviation expansion.'''
    text = convert_to_ascii(text)
    text = lowercase(text)
    text = expand_numbers(text)
    text = expand_abbreviations(text)
    text = collapse_whitespace(text)
    return text

def yiddish_cleaners_unpointed(text):
    '''Pipeline for unpointed Yiddish text.'''
    text = normalise_unicode(text)
    text = depoint(text)
    text = collapse_whitespace(text)
    return text


def yiddish_cleaners(text):
    '''Pipeline for pointed Yiddish text.'''
    text = normalise_unicode(text)
    text = collapse_whitespace(text)
    return text