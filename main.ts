/// <reference path="node.d.ts" />

import util = require('util')

export class Bot {

  private args: any;

  constructor(args:Object){
    this.args = args;
  }

  execute(cb:any){
      let args = this.args;
      let command:string = args.command;

      if (command){
        if (command.indexOf("color") < 0){
          cb({
              "text": "Nope, bb-8 says he does not know that command."
          });
        }
        else{
          let actualColor:string = ""; 
          var num = Math.random();
          if (num < 0.2) {
            actualColor = "blue";
          } else if (num < 0.4) {
            actualColor = "green";
          } else if (num < 0.6) {
            actualColor = "red";
          } else if (num < 0.8) {
            actualColor = "yellow";
          } else {
            actualColor = "white";
          }
          cb({
            color : util.format(actualColor)
          });
        }
      } else {
        throw "Missing \"color\" property."
      }
    }
  }
