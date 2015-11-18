#!/bin/bash
#this is a routine export mongodb table shell
RIGHT_NOW=$(date +"%m-%d-%Y-%H-%M-%S")

#forum data
mongoexport --quiet --port 27017 -d test -c article_models -f action,userName,userId,userAccount,courseId,chapterId,title,text_content,discussion_id,article_id,time  --csv -o /home/Netxtream/api-server/csvs/routine_csv/article_record_${RIGHT_NOW}.csv
#exercise data
mongoexport --quiet --port 27017 -d test -c exercise_records -f exerciseId,exerciseType,correctAns,studentAns,execOrder,courseId,chapterId,getScore,execTotalCount,userId,time --csv -o /home/Netxtream/api-server/csvs/routine_csv/exercise_record_${RIGHT_NOW}.csv

#page data
mongoexport --quiet --port 27017 -d test -c page_records -f action,userId,userAccount,page,courseId,chapterId,time --csv -o /home/Netxtream/api-server/csvs/routine_csv/page_record_${RIGHT_NOW}.csv

#login data
mongoexport --quiet --port 27017 -d test -c login_records -f action,userId,userAccount,time --csv -o /home/Netxtream/api-server/csvs/routine_csv/login_record_${RIGHT_NOW}.csv

#video data
mongoexport --queit --port 27017 -d test -c video_records -f action,userId,userAccount,videoStartTime,videoEndTime,videoId,videoTotalTime,courseId,chapterId,chapterVideoCount,chapterVideoOrder,playRate --csv -o /home/Netxtream/api-server/csvs/routine_csv/video_record_${RIGHT_NOW}.csv

#==============export with query=====================
#login
mongoexport --quiet --port 27017 -d test -q {"action":"log in"} -c login_records -f action,userId,userAccount,time --csv -o /home/Netxtream/api-server/csvs/routine_csv/login.csv
#article
mongoexport --quiet --port 27017 -d test -q {"courseId":616} -c article_models -f action,userId,courseId,time  --csv -o /home/Netxtream/api-server/csvs/routine_csv/article_record.csv
#exercise
mongoexport --quiet --port 27017 -d test -q {"courseId":616} -c exercise_records -f getScore,userId,time --csv -o /home/Netxtream/api-server/csvs/routine_csv/exercise_record.csv
#video
mongoexport  --port 27017 -d test -q {"courseId":616} -c video_records -f action,userId --csv -o /home/Netxtream/api-server/csvs/routine_csv/video_record.csv
