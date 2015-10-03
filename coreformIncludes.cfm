<!---  
 *  Copyright Charles Kaufmann, 2008  |  http://www.compositeweb.com
 * ---------------------------------------------------------------------------
 * Details and latest version at:
 * http://www.compositeweb.com
 *
 *   coreForms - a set of Coldfusion custom tags that make the creation of forms easy
 *   Copyright (C) 2008 Charles Kaufmann
 *
 *   This library is free software; you can redistribute it and/or
 *   modify it under the terms of the GNU Lesser General Public
 *   License as published by the Free Software Foundation; either
 *   version 2.1 of the License, or (at your option) any later version.
 *
 *   This library is distributed in the hope that it will be useful,
 *   but WITHOUT ANY WARRANTY; without even the implied warranty of
 *   MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the GNU
 *   Lesser General Public License for more details.
 *
 *   You should have received a copy of the GNU Lesser General Public
 *   License along with this library; if not, write to the Free Software
 *   Foundation, Inc., 51 Franklin Street, Fifth Floor, Boston, MA  02110-1301  USA
 *
 --->

<!--- This path is unique to any setup, you need to adjust it depending on where
  on the server you place the coreForms folder. If there is a coldfusion mapping
  to the '/', then you will have to put the coreForms within that mapping. --->
<cfset coreFormBasePath = "/coreforms/">
<!--- I have included this part in case the above is a coldfusion mapping, 
  all the javascript and css has to be called from the web root --->
<cfset coreFormWebRootPath = "/coreforms/">

<cfset coreform = "#coreFormBasePath#coreform.cfm">
<cfset corefield = "#coreFormBasePath#corefield.cfm">
<cfset corerule = "#coreFormBasePath#corerule.cfm">
<cfset coretable = "#coreFormBasePath#coretable.cfm">
<cfset coredirections = "#coreFormBasePath#coredirections.cfm">
<cfset coreformpopups = "#coreFormBasePath#handlers/">
<cfset coreformimages = "#coreFormBasePath#images/">

<cfset request.coreformbasepath = "#coreFormBasePath#">
<cfset request.coreFormWebRootPath = "#coreFormWebRootPath#">

<cfset theLanguage='english'>
<cfinclude template="#coreformbasepath#core_udfs.cfm">
<cfinclude template="#coreformbasepath#language/#theLanguage#.cfm">
