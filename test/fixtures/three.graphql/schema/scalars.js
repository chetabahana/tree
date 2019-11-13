'use strict'

/**
 * Color type
 
exports.Color = {
  parseValue(value) {
    return parseInt(String(value))
  },

  serialize(value) {
    return parseInt(String(value))
  }
}
*/

import { GraphQLScalarType } from 'graphql';
import { makeExecutableSchema } from 'graphql-tools';

exports.Color = new GraphQLScalarType({
  name: 'Color',
  description: 'Description of my custom scalar type',
  serialize(value) {
    let result;
    // Implement your own behavior here by setting the 'result' variable
    return result;
  },
  parseValue(value) {
    let result;
    // Implement your own behavior here by setting the 'result' variable
    return result;
  },
  parseLiteral(ast) {
    switch (ast.kind) {
      // Implement your own behavior here by returning what suits your needs
      // depending on ast.kind
    }
  }
});
