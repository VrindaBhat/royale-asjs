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
package
{
  public class XMLText extends XML
  {
    public function XMLText()
    {
      super();
			resetNodeKind();
    }
		override protected function getNodeRef():String{
			return "t";
		}

		override public function copy():XML
		{
			var i:int;
			var xml:XML = new XMLText();
			xml.setName(name());
			if(_value)xml.setValue(_value);
			var len:int;
			len = namespaceLength();
			for(i=0;i<len;i++)
			{
				xml.addNamespace(new Namespace(_namespaces[i]));
			}
			//parent should be null by default
			len = attributeLength();
			for(i=0;i<len;i++)
				xml.addChildInternal(_attributes[i].copy());
			len = childrenLength();
			for(i=0;i<len;i++)
				xml.addChildInternal(_children[i].copy());
			
			return xml;
		}    
  }
}