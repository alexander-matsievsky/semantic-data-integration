FROM jupyter/all-spark-notebook:d113a601dbb8
ENV JUPYTER_ENABLE_LAB=yes
RUN pip install PyLD altair nb-black rdflib rdflib-jsonld
# See https://github.com/ipython/ipython/issues/12740.
RUN pip install jedi==0.17.2

USER root
RUN apt-get update && apt-get install -y jq wget
RUN wget -qP/opt https://github.com/AtomGraph/JSON2RDF/releases/download/1.0.1/json2rdf-1.0.1-jar-with-dependencies.jar
USER $NB_USER
