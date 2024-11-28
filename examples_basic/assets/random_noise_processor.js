/*
 * Copyright 2024 Canardoux.
 *
 * This file is part of the τ project.
 *
 * τ is free software: you can redistribute it and/or modify
 * it under the terms of the GNU General Public License version 3 (GPL3), as published by
 * the Free Software Foundation.
 *
 * τ is distributed in the hope that it will be useful,
 * but WITHOUT ANY WARRANTY; without even the implied warranty of
 * MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the
 * GNU General Public License for more details.
 *
 * You should have received a copy of the GNU General Public License
 * along with τ.  If not, see <https://www.gnu.org/licenses/>.
 */


class RandomNoiseProcessor extends AudioWorkletProcessor {

  constructor(...args) {
    super(...args);
    this.port.onmessage = (e) => {
      console.log('JS:Rcv ' + e.data);
      this.port.postMessage("pong (" + e.data + ")");
    };
  }

  process(inputs, outputs, parameters) {
    //console.log('momo = ' + parameters.momo.toString());
    //console.log('mimi = ' +  parameters.mimi.toString());
    //console.log(parameters);
    
    const output = outputs[0];
    output.forEach((channel) => {
      for (let i = 0; i < channel.length; i++) {
        channel[i] = Math.random() * 2 - 1;
      }
    });
    
    return true;
  }

  static get parameterDescriptors() {
    return [
     {
        name: "momo",
        defaultValue: '3.14',
      },
      {
        name: "mimi",
        defaultValue: 123,
        minValue: 0,
        maxValue: 1000,
        automationRate: "a-rate",

      }
    ];
  }
}

registerProcessor("random-noise-processor", RandomNoiseProcessor);

