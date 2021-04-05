#python3 -m venv venv
#source venv/bin/activate
#pip install -r requirements.txt
gunicorn -c config.py server:app