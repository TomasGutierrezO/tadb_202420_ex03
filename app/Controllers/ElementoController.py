from flask import Blueprint, jsonify, request
from app.Services.ElementoService import ElementoService

elemento_blueprint = Blueprint('elementos', __name__)

@elemento_blueprint.route('/elementos', methods=['GET'])
def listar_elementos():
    elementos = ElementoService.listar_elementos()
    return jsonify([e.to_dict() for e in elementos])

@elemento_blueprint.route('/elementos/<guid>', methods=['GET'])
def obtener_elemento(guid):
    elemento = ElementoService.obtener_elemento_por_guid(guid)
    return jsonify(elemento.to_dict()) if elemento else ('Elemento no encontrado', 404)

@elemento_blueprint.route('/elementos', methods=['POST'])
def agregar_elemento():
    data = request.json
    elemento = ElementoService.agregar_elemento(data)
    return jsonify(elemento.to_dict()), 201

@elemento_blueprint.route('/elementos/<guid>', methods=['PUT'])
def actualizar_elemento(guid):
    data = request.json
    elemento = ElementoService.actualizar_elemento(guid, data)
    return jsonify(elemento.to_dict()) if elemento else ('Elemento no encontrado', 404)

@elemento_blueprint.route('/elementos/<guid>', methods=['DELETE'])
def eliminar_elemento(guid):
    elemento = ElementoService.obtener_elemento_por_guid(guid)
    ElementoService.eliminar_elemento(guid)
    return 'elemento eliminado:' ,elemento, 204