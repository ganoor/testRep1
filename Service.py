from flask import Flask, jsonify
from flask_cors import CORS
from controllers.AppUtilsController import app_utils_bp

app = Flask(__name__)
cors_api = CORS(app, resources={r"/api/*": {"origins": "*"}})
cors = CORS(app, resources={r"/appapi/*": {"origins": "*"}})



app.register_blueprint(app_utils_bp, url_prefix = '/appapi')

@app.errorhandler(Exception)
def handle_exception(error):
    return jsonify({'status': 'Failed', 'message': 'An unexpected error occurred while processing your request. Please try again later. For more details, check the server logs.'}), 500

if __name__ == '__main__':
    app.run(host='0.0.0.0', port=5000)
