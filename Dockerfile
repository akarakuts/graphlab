############################################################
# Dockerfile to run graphlab
# Based on Anakonda2 4.0.0 Image
############################################################

FROM karakuts/anaconda2
MAINTAINER Aleksey Karakuts <aleksey@karakuts.com>

ARG GL_USER_EMAIL
ARG GL_USER_KEY

RUN mkdir -p /workspace
WORKDIR /workspace

RUN set -eux \
    && apt-get update && apt-get install -y \
    && apt-get install -y --no-install-recommends build-essential libssl-dev -y \
    && rm -rf /var/lib/apt/lists/* \
    && pip install  --upgrade pip boto jsonschema colorama scikit-learn \
    && conda install -y ipython ipython-notebook \
    && pip install --upgrade --no-cache-dir --upgrade --no-cache-dir https://get.graphlab.com/GraphLab-Create/2.1/${GL_USER_EMAIL}/${GL_USER_KEY}/GraphLab-Create-License.tar.gz

COPY requirements.txt /tmp/requirements.txt
RUN set -eux \
    && pip install --no-cache-dir -r /tmp/requirements.txt \
    && rm -fv /tmp/zomato-requirements.txt \
    && conda clean --all --yes
ADD notebook.sh /
RUN chmod +x /notebook.sh && mkdir -p /workplace/notebooks && mkdir -p /workplace/data
CMD ["/notebook.sh"]
