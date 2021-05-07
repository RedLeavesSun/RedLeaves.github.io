#!/bin/bash

BASE_NAME=`basename $0 | cut -d "." -f 1`

AUTHOR="RedLeaves"

function usage() {
    echo "usage: ${BASE_NAME} <post-name>"
}

if [ $# -eq 0 ]; then
    usage
    exit 1
fi

for POST_NAME in $*
do
    DATE=`date "+%F"`
    TIME=`date "+%T"`
    TIME_ZONE=`date "+%z"`

    POST_NAME=${DATE}-${POST_NAME}

    POST_NAME_MD=${POST_NAME}.md
    POST_NAME_DIR=${POST_NAME}

    if [ -f ${POST_NAME_MD} ]; then
        rm -rfi ${POST_NAME_MD}
    fi

    if [ -f ${POST_NAME_DIR} ];then
        rm -rfi ${POST_NAME_DIR}
    fi

    echo "post: ${POST_NAME_MD}"

    echo "---" >> ${POST_NAME_MD}
    echo "layout: post" >> ${POST_NAME_MD}
    echo "title: Title" >> ${POST_NAME_MD}
    echo "subtitle: Subtitle" >> ${POST_NAME_MD}
    echo "date: ${DATE} ${TIME} ${TIME_ZONE}" >> ${POST_NAME_MD}
    echo "author: ${AUTHOR}" >> ${POST_NAME_MD}
    echo "header-img: " >> ${POST_NAME_MD}
    echo "catalog: true" >> ${POST_NAME_MD}
    echo "tag:" >> ${POST_NAME_MD}
    echo "  - tag" >> ${POST_NAME_MD}
    echo "---" >> ${POST_NAME_MD}

    mkdir ${POST_NAME_DIR}
done
