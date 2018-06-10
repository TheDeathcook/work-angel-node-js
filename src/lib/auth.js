'use strict';
const crypto = require('crypto');

const genRandomString = function(length){
  return crypto.randomBytes(Math.ceil(length/2))
          .toString('hex') /** convert to hexadecimal format */
          .slice(0,length);   /** return required number of characters */
};

const getHash = function(password, salt){
  var hash = crypto.createHmac('sha512', salt); /** Hashing algorithm sha512 */
  hash.update(password);
  var value = hash.digest('hex');
  return value;
};

const verifyPassword = (password, hash, salt) => {
  const newHash = getHash(password, salt);
  
  if(newHash.length != hash.length) {
    return false;
  }

  var valid = true;

  for(var i = 0; i < hash.length; i++) {
    if(hash[i] != newHash[i]) {
      valid = false;
    }
  }

  return valid;
};

module.exports = {
  getHash,
  genRandomString,
  verifyPassword
}