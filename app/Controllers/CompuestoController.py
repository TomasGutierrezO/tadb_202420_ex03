from flask import Blueprint, jsonify, request
from app.Services.CompuestoService import CompuestoService

compuesto_blueprint = Blueprint('compuestos', __name__)

@compuesto_blueprint.route('/compuestos', methods=['GET'])
def listar_compuestos():
    compuestos = CompuestoService.listar_compuestos()
    return jsonify([c.to_dict() for c in compuestos])

@compuesto_blueprint.route('/compuestos/<guid>', methods=['GET'])
def obtener_compuesto(guid):
    compuesto = CompuestoService.obtener_compuesto_por_guid(guid)
    return jsonify(compuesto.to_dict()) if compuesto else ('Compuesto no encontrado', 404)

@compuesto_blueprint.route('/compuestos', methods=['POST'])
def agregar_compuesto():
    data = request.json
    elementos_conformantes = data.pop('elementos_conformantes', [])
    compuesto = CompuestoService.agregar_compuesto(data, elementos_conformantes)
    return jsonify(compuesto.to_dict()), 201

@compuesto_blueprint.route('/compuestos/<guid>', methods=['PUT'])
def actualizar_compuesto(guid):
    data = request.json
    elementos_conformantes = data.pop('elementos_conformantes', [])
    compuesto = CompuestoService.actualizar_compuesto(guid, data, elementos_conformantes)
    return jsonify(compuesto.to_dict()) if compuesto else ('Compuesto no encontrado', 404)

@compuesto_blueprint.route('/compuestos/<guid>', methods=['DELETE'])
def eliminar_compuesto(guid):
    CompuestoService.eliminar_compuesto(guid)
    return '', 204
