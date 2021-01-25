// Auto-generated. Do not edit!

// (in-package wesley_yee_ws.msg)


"use strict";

const _serializer = _ros_msg_utils.Serialize;
const _arraySerializer = _serializer.Array;
const _deserializer = _ros_msg_utils.Deserialize;
const _arrayDeserializer = _deserializer.Array;
const _finder = _ros_msg_utils.Find;
const _getByteLength = _ros_msg_utils.getByteLength;

//-----------------------------------------------------------

class scan_range {
  constructor(initObj={}) {
    if (initObj === null) {
      // initObj === null is a special case for deserialization where we don't initialize fields
      this.farthest_distance = null;
      this.closest_distance = null;
    }
    else {
      if (initObj.hasOwnProperty('farthest_distance')) {
        this.farthest_distance = initObj.farthest_distance
      }
      else {
        this.farthest_distance = 0.0;
      }
      if (initObj.hasOwnProperty('closest_distance')) {
        this.closest_distance = initObj.closest_distance
      }
      else {
        this.closest_distance = 0.0;
      }
    }
  }

  static serialize(obj, buffer, bufferOffset) {
    // Serializes a message object of type scan_range
    // Serialize message field [farthest_distance]
    bufferOffset = _serializer.float32(obj.farthest_distance, buffer, bufferOffset);
    // Serialize message field [closest_distance]
    bufferOffset = _serializer.float32(obj.closest_distance, buffer, bufferOffset);
    return bufferOffset;
  }

  static deserialize(buffer, bufferOffset=[0]) {
    //deserializes a message object of type scan_range
    let len;
    let data = new scan_range(null);
    // Deserialize message field [farthest_distance]
    data.farthest_distance = _deserializer.float32(buffer, bufferOffset);
    // Deserialize message field [closest_distance]
    data.closest_distance = _deserializer.float32(buffer, bufferOffset);
    return data;
  }

  static getMessageSize(object) {
    return 8;
  }

  static datatype() {
    // Returns string type for a message object
    return 'wesley_yee_ws/scan_range';
  }

  static md5sum() {
    //Returns md5sum for a message object
    return '52cfcfd2a0bc23fbbffa6ecb4b63c13e';
  }

  static messageDefinition() {
    // Returns full string definition for message
    return `
    float32 farthest_distance
    float32 closest_distance
    
    `;
  }

  static Resolve(msg) {
    // deep-construct a valid message object instance of whatever was passed in
    if (typeof msg !== 'object' || msg === null) {
      msg = {};
    }
    const resolved = new scan_range(null);
    if (msg.farthest_distance !== undefined) {
      resolved.farthest_distance = msg.farthest_distance;
    }
    else {
      resolved.farthest_distance = 0.0
    }

    if (msg.closest_distance !== undefined) {
      resolved.closest_distance = msg.closest_distance;
    }
    else {
      resolved.closest_distance = 0.0
    }

    return resolved;
    }
};

module.exports = scan_range;
