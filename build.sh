#!/bin/bash
docker build -t=graphlab --build-arg "GL_USER_EMAIL=mbox@mbox.com" --build-arg "GL_USER_KEY=1111-2222-3333-4444-5555-6666-7777-8888" .
