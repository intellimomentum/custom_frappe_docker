# syntax=docker/dockerfile:1.3

ARG ERPNEXT_VERSION
FROM frappe/erpnext-worker:${ERPNEXT_VERSION}

COPY repos ../apps

USER root

RUN install-app hrms 
RUN install-app erpnext_datev
RUN install-app erpnext_germany
RUN install-app erpnextfints
RUN install-app customization 

USER frappe
