import pyotherside
from pygments import highlight
from pygments.lexers import get_lexer_by_name
from pygments.formatters import HtmlFormatter

def format(code, lexer):
    return highlight(code, get_lexer_by_name(lexer, stripall=True), HtmlFormatter(style="vim", linenos=False, noclasses=True))
