export test42=%env.test42%
export test36=%env.test36%
echo test42
echo test36

gunicorn -c config.py server:app