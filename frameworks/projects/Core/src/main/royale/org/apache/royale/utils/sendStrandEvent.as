////////////////////////////////////////////////////////////////////////////////
//
//  Licensed to the Apache Software Foundation (ASF) under one or more
//  contributor license agreements.  See the NOTICE file distributed with
//  this work for additional information regarding copyright ownership.
//  The ASF licenses this file to You under the Apache License, Version 2.0
//  (the "License"); you may not use this file except in compliance with
//  the License.  You may obtain a copy of the License at
//
//      http://www.apache.org/licenses/LICENSE-2.0
//
//  Unless required by applicable law or agreed to in writing, software
//  distributed under the License is distributed on an "AS IS" BASIS,
//  WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied.
//  See the License for the specific language governing permissions and
//  limitations under the License.
//
////////////////////////////////////////////////////////////////////////////////
package org.apache.royale.utils
{
  COMPILE::SWF
  {
    import flash.events.Event;
  }

  import org.apache.royale.core.IStrand;
  import org.apache.royale.events.IEventDispatcher;

  /**
   * Helper function for dispatching events from the strand
   * Using this function prevent the need to cast IStrand objects
   * It also allows better minification
   * @royalesuppressexport
   * @royaleignorecoercion org.apache.royale.events.IEventDispatcher
   */
  public function sendStrandEvent(strand:IStrand,event:Object):void
  {
      COMPILE::SWF{
        if(event is String)
          event = new flash.events.Event(event as String);
        (strand as IEventDispatcher).dispatchEvent(event as flash.events.Event);
      }
      COMPILE::JS
      {
        (strand as IEventDispatcher).dispatchEvent(event);
      }
  }
}