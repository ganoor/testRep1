import platform

import requests
from flask import Blueprint, send_file
from flask import jsonify, request
from flask_cors import cross_origin


app_utils_bp = Blueprint('app_utils_bp', __name__)


@app_utils_bp.route('/ping')
# @check_for_token
@cross_origin()
def ping():
    try:
        return jsonify({"status": "success", "dbnode_details":"success"})
    except Exception as e:
        return jsonify({"status": "fail", "message": "An error occurred while processing the ping request."}), 500
