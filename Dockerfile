FROM nnurphy/deb

ENV PYTHONUNBUFFERED=x

RUN set -ex \
  ; pip3 --no-cache-dir install python3-setuptools \
        cachetools config transitions chronyk fn.py \
        SciPy Numpy numpydoc Scikit-learn scikit-image Pandas numba \
        matplotlib Seaborn Bokeh \
        Statsmodels SymPy Gensim numexpr NLTK networkx \
        Requests furl html5lib flask pyyaml \
        PyParsing decorator more-itertools \
        fabric chardet click \
  ; pip3 config set global.index-url https://pypi.tuna.tsinghua.edu.cn/simple