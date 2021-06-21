""" from https://github.com/keithito/tacotron """

"""
Defines the set of symbols used in text input to the model.

The default is a set of ASCII characters that works well for English or text that has been run through Unidecode. For other data, you can modify _characters. See TRAINING_DATA.md for details. """

#from text import cmudict, pinyin

# [_!()',.:;? \-־׳״אאַאָבבּבֿגדהווּײװױזחטייִײַכּכךלמםנןסעפּפֿפףצץקרששׂתּת0123456789]
# [_!()',.:;? \-־׳״אבגדהוזחטייִכךלמםנןסעפףצץקרשת0123456789]

_pad = "_"
_punctuation = "!()',.:;? "
_special = "־׳״-"
#_letters = "ABCDEFGHIJKLMNOPQRSTUVWXYZabcdefghijklmnopqrstuvwxyz"
_letters = "אאַאָבבּבֿגדהווּײװױזחטייִײַכּכךלמםנןסעפּפֿפףצץקרששׂתּת0123456789"
#_letters = ["א", "אַ", "אָ", "ב", "בּ", "בֿ", "ג", "ד", "ה", "ו", "וּ", "ײ", "װ", "ױ", "ז", "ח", "ט", "י", "יִ", "ײַ", "כּ", "כ", "ך", "ל", "מ", "ם", "נ", "ן", "ס", "ע", "פּ", "פֿ", "פ", "ף", "צ", "ץ", "ק", "ר", "ש", "שׂ", "תּ", "ת", "0", "12", "3", "4", "5", "6", "7", "8", "9"]
_silences = ["sp", "spn", "sil"]

# Prepend "@" to ARPAbet symbols to ensure uniqueness (some are the same as uppercase letters):
#_arpabet = ["@" + s for s in cmudict.valid_symbols]
#_pinyin = ["@" + s for s in pinyin.valid_symbols]

# Export all symbols:
symbols = (
    [_pad]
    + list(_special)
    + list(_punctuation)
    + list(_letters)
    #+ _arpabet
    #+ _pinyin
    + _silences
)
