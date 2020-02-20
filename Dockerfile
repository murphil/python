FROM nnurphy/deb

ENV PYTHONUNBUFFERED=x

RUN set -ex \
  #; apt-get update \
  #; apt-get install -y --no-install-recommends python3-setuptools \
  #; apt-get autoremove -y && apt-get clean -y && rm -rf /var/lib/apt/lists/* \
  ; pip3 --no-cache-dir install \
        cachetools config transitions chronyk fn.py \
        SciPy Numpy numpydoc Scikit-learn scikit-image Pandas numba \
        matplotlib Seaborn Bokeh \
        Statsmodels SymPy Gensim numexpr NLTK networkx \
        Requests furl html5lib flask pyyaml \
        PyParsing decorator more-itertools \
        fabric chardet click \
  ; pip3 config set global.index-url https://pypi.tuna.tsinghua.edu.cn/simple