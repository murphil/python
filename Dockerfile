FROM nnurphy/ub

ENV PYTHONUNBUFFERED=x

RUN set -eux \
  ; apt-get update -y \
  ; DEBIAN_FRONTEND=noninteractive \
    apt-get install -y --no-install-recommends \
    python3 python3-pip python3-setuptools ipython3 \
  ; apt-get autoremove -y && apt-get clean -y && rm -rf /var/lib/apt/lists/* \
  ; pip3 --no-cache-dir install \
        cachetools config pyyaml transitions chronyk fn.py \
        SciPy Numpy numpydoc Scikit-learn scikit-image Pandas numba \
        matplotlib Seaborn Bokeh \
        Statsmodels SymPy Gensim numexpr NLTK networkx \
        fastapi uvicorn Requests furl html5lib \
        PyParsing decorator more-itertools \
        fabric chardet click \
  ; pip3 config set global.index-url https://pypi.tuna.tsinghua.edu.cn/simple