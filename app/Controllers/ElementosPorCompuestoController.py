from flask import Blueprint, jsonify, request
from app.Services.ElementosPorCompuestoService import ElementosPorCompuestoService

elemento_por_compuesto_blueprint = Blueprint('elementos_por_compuesto', __name__)

@elemento_por_compuesto_blueprint.route('/elementos_por_compuesto', methods=['POST'])
def agregar_elemento_por_compuesto():
    data = request.json
    elemento_por_compuesto = ElementosPorCompuestoService.agregar_elemento_por_compuesto(data)
    return jsonify(elemento_por_compuesto.to_dict()), 201

@elemento_por_compuesto_blueprint.route('/elementos_por_compuesto', methods=['DELETE'])
def eliminar_elemento_por_compuesto():
    guid_elemento = request.args.get('guid_elemento')
    guid_compuesto = request.args.get('guid_compuesto')
    ElementosPorCompuestoService.eliminar_elemento_por_compuesto(guid_elemento, guid_compuesto)
    return '', 204
