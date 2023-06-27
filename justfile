#!/usr/bin/env just --justfile

[private]
default:
    @just --list

upload-file file_path vault_id item_id:
    cat {{file_path}} | op document edit --vault {{vault_id}} {{item_id}}
