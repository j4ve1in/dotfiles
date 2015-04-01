# Tasks
if [ -e TASKS_FILE_PATH ]; then
    alias tasks="vi TASKS_FILE_PATH"
else
    alias tasks="echo File Not Found"
fi

# Note
DATE=$(date +"%Y-%m-%d_%H%M%S")
if [ -d DROPBOX_PATH ]; then
    alias note='vi $DROPBOX_PATH${DATE}.md'
else
    alias note="echo Directory Not Found"
fi
