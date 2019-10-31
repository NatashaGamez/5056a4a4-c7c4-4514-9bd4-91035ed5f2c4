import os

DB_CONFIG = {
    "user": os.environ.get('INSTAGRAM_DB_USER', ''),
    "pwd": os.environ.get('INSTAGRAM_DB_PWD', ''),
    "name": os.environ.get('INSTAGRAM_DB_NAME', ''),
    "host": os.environ.get('INSTAGRAM_DB_HOST', ''),
    "port": os.environ.get('INSTAGRAM_DB_PORT', '')
}

SQLALCHEMY_DATABASE_URI = f"postgresql://{DB_CONFIG['user']}:{DB_CONFIG['pwd']}@{DB_CONFIG['host']}:{DB_CONFIG['port']}/{DB_CONFIG['name']}"
