<cfcomponent displayname="TaxRate" output="false" extends="cfc.xeroclient"
  hint="I am the TaxRate Class.">

<!--- PROPERTIES --->

  <cfproperty name="Name" type="String" default="" />
  <cfproperty name="TaxType" type="String" default="" />
  <cfproperty name="TaxComponents" type="List[TaxComponent]" default="" />
  <cfproperty name="Status" type="StatusEnum" default="" />
  <cfproperty name="ReportTaxType" type="String" default="" />
  <cfproperty name="CanApplyToAssets" type="BigDecimal" default="" />
  <cfproperty name="CanApplyToEquity" type="BigDecimal" default="" />
  <cfproperty name="CanApplyToExpenses" type="BigDecimal" default="" />
  <cfproperty name="CanApplyToLiabilities" type="BigDecimal" default="" />
  <cfproperty name="CanApplyToRevenue" type="BigDecimal" default="" />
  <cfproperty name="DisplayTaxRate" type="BigDecimal" default="" />
  <cfproperty name="EffectiveRate" type="BigDecimal" default="" />

<!--- INIT --->
  <cffunction name="init" access="public" output="false"
    returntype="any" hint="I am the constructor method for the TaxRate Class.">
      
    <cfreturn this />
  </cffunction>


  <cffunction name="XMLtoObject" access="public" output="false">
     <cfargument name="objects" required="true" type="struct" default="" hint="I am a structure of this object." />

      <cfif isArray(arguments.objects)>
        <cfloop array="#arguments.objects#" index="obj">
          <cfscript>
            populate(obj);
          </cfscript>
        </cfloop>
      <cfelse>
        <cfscript>
          return populate(arguments.objects);
        </cfscript>
     </cfif>
  </cffunction>

  <cffunction name="toJSON" access="public" output="false">
     <cfargument name="exclude" type="String" default="" hint="I am a list of attributes to exclude from JSON payload" />
    
     
        <cfscript>
          myStruct=StructNew();

          if (structKeyExists(variables.instance,"Name")) {
            if (NOT listFindNoCase(arguments.exclude, "Name")) {
              myStruct.Name=getName();
            }
          }
          if (structKeyExists(variables.instance,"TaxType")) {
            if (NOT listFindNoCase(arguments.exclude, "TaxType")) {
              myStruct.TaxType=getTaxType();
            }
          }
          if (structKeyExists(variables.instance,"TaxComponents")) {
            if (NOT listFindNoCase(arguments.exclude, "TaxComponents")) {
              myStruct.TaxComponents=getTaxComponents();
            }
          }
          if (structKeyExists(variables.instance,"Status")) {
            if (NOT listFindNoCase(arguments.exclude, "Status")) {
              myStruct.Status=getStatus();
            }
          }
          if (structKeyExists(variables.instance,"ReportTaxType")) {
            if (NOT listFindNoCase(arguments.exclude, "ReportTaxType")) {
              myStruct.ReportTaxType=getReportTaxType();
            }
          }
          if (structKeyExists(variables.instance,"CanApplyToAssets")) {
            if (NOT listFindNoCase(arguments.exclude, "CanApplyToAssets")) {
              myStruct.CanApplyToAssets=getCanApplyToAssets();
            }
          }
          if (structKeyExists(variables.instance,"CanApplyToEquity")) {
            if (NOT listFindNoCase(arguments.exclude, "CanApplyToEquity")) {
              myStruct.CanApplyToEquity=getCanApplyToEquity();
            }
          }
          if (structKeyExists(variables.instance,"CanApplyToExpenses")) {
            if (NOT listFindNoCase(arguments.exclude, "CanApplyToExpenses")) {
              myStruct.CanApplyToExpenses=getCanApplyToExpenses();
            }
          }
          if (structKeyExists(variables.instance,"CanApplyToLiabilities")) {
            if (NOT listFindNoCase(arguments.exclude, "CanApplyToLiabilities")) {
              myStruct.CanApplyToLiabilities=getCanApplyToLiabilities();
            }
          }
          if (structKeyExists(variables.instance,"CanApplyToRevenue")) {
            if (NOT listFindNoCase(arguments.exclude, "CanApplyToRevenue")) {
              myStruct.CanApplyToRevenue=getCanApplyToRevenue();
            }
          }
          if (structKeyExists(variables.instance,"DisplayTaxRate")) {
            if (NOT listFindNoCase(arguments.exclude, "DisplayTaxRate")) {
              myStruct.DisplayTaxRate=getDisplayTaxRate();
            }
          }
          if (structKeyExists(variables.instance,"EffectiveRate")) {
            if (NOT listFindNoCase(arguments.exclude, "EffectiveRate")) {
              myStruct.EffectiveRate=getEffectiveRate();
            }
          }
        </cfscript>

      <cfset variables.jsonObj = serializeJSON(myStruct)>

   <cfreturn variables.jsonObj />
  </cffunction>

  <cffunction name="populate" access="public" output="false">
     <cfargument name="objects" required="true" type="struct" default="" hint="I am a structure of this object." />

        <cfset obj = arguments.objects>
        <cfscript>

        if (structKeyExists(obj,"Name")) {
          setName(obj.Name);
        } else {
          setName("");
        }
        if (structKeyExists(obj,"TaxType")) {
          setTaxType(obj.TaxType);
        } else {
          setTaxType("");
        }
        if (structKeyExists(obj,"TaxComponents")) {
          setTaxComponents(obj.TaxComponents);
        } else {
          setTaxComponents("");
        }
        if (structKeyExists(obj,"Status")) {
          setStatus(obj.Status);
        } else {
          setStatus("");
        }
        if (structKeyExists(obj,"ReportTaxType")) {
          setReportTaxType(obj.ReportTaxType);
        } else {
          setReportTaxType("");
        }
        if (structKeyExists(obj,"CanApplyToAssets")) {
          setCanApplyToAssets(obj.CanApplyToAssets);
        } else {
          setCanApplyToAssets("");
        }
        if (structKeyExists(obj,"CanApplyToEquity")) {
          setCanApplyToEquity(obj.CanApplyToEquity);
        } else {
          setCanApplyToEquity("");
        }
        if (structKeyExists(obj,"CanApplyToExpenses")) {
          setCanApplyToExpenses(obj.CanApplyToExpenses);
        } else {
          setCanApplyToExpenses("");
        }
        if (structKeyExists(obj,"CanApplyToLiabilities")) {
          setCanApplyToLiabilities(obj.CanApplyToLiabilities);
        } else {
          setCanApplyToLiabilities("");
        }
        if (structKeyExists(obj,"CanApplyToRevenue")) {
          setCanApplyToRevenue(obj.CanApplyToRevenue);
        } else {
          setCanApplyToRevenue("");
        }
        if (structKeyExists(obj,"DisplayTaxRate")) {
          setDisplayTaxRate(obj.DisplayTaxRate);
        } else {
          setDisplayTaxRate("");
        }
        if (structKeyExists(obj,"EffectiveRate")) {
          setEffectiveRate(obj.EffectiveRate);
        } else {
          setEffectiveRate("");
        }
      </cfscript>
      
   <cfreturn this />
  </cffunction>

  <cffunction name="getAll" access="public" returntype="any">
    <cfargument name="ifModifiedSince"  type="string" default="">
      <cfset this.setList(this.get(endpoint="TaxRates"))>
    <cfreturn this>
  </cffunction>

  <cffunction name="getById" access="public" returntype="any">
    <cfargument name="id"  type="string" default="">
    
    <cfset var ArrayResult = this.get(endpoint="TaxRates",id=id)>
    <cfscript>
      this.populate(ArrayResult[1]);
    </cfscript>

    <cfreturn this>
  </cffunction>

  <cffunction name="create" access="public" output="false">
    <cfset variables.result = Super.put(endpoint="TaxRates",body=this.toJSON())>
    
    <cfloop from="1" to="#ArrayLen(variables.result)#" index="i">
      <cfset temp = this.populate(variables.result[i])>
    </cfloop>

    <cfreturn this />
  </cffunction>

  <cffunction name="update" access="public" output="false">
    <cfset variables.result = Super.post(endpoint="TaxRates",body=this.toJSON(),id=this.getTaxRateID())>
    
    <cfloop from="1" to="#ArrayLen(variables.result)#" index="i">
      <cfset temp = this.populate(variables.result[i])>
    </cfloop>

    <cfreturn this />
  </cffunction>

  <cffunction name="archive" access="public" output="false">
    <cfset variables.result = Super.post(endpoint="TaxRates",body=this.toJSON(),id=this.getTaxRateID())>
    
    <cfloop from="1" to="#ArrayLen(variables.result)#" index="i">
      <cfset temp = this.populate(variables.result[i])>
    </cfloop>

    <cfreturn this />
  </cffunction>

  <cffunction name="delete" access="public" output="false">
    <cfset variables.result = Super.delete(endpoint="TaxRates",body=this.toJSON(),id=this.getTaxRateID())>
    
    <cfloop from="1" to="#ArrayLen(variables.result)#" index="i">
      <cfset temp = this.populate(variables.result[i])>
    </cfloop>

    <cfreturn this />
  </cffunction>

  <cffunction name="getObject" access="public" returntype="any">
    <cfargument name="position"  type="numeric" default="">
      <cfscript>
        this.populate(this.getList()[position]);
      </cfscript> 
    <cfreturn this>
  </cffunction>

  <cffunction name="setList" access="public"  output="false" hint="I set the array of TaxRates">
    <cfargument name="list" type="Array" hint="I am the list." />
      <cfset this.list = arguments.list />
  </cffunction>

  <cffunction name="getList" access="public" output="false" hint="I return the array of TaxRates">
    <cfreturn this.list />
  </cffunction>

<!--- GETTER / SETTER  --->

  <!---
   * Name of tax rate
   * @return Name
  --->
  <cffunction name="getName" access="public" output="false" hint="I return the Name">
    <cfreturn variables.instance.Name />
  </cffunction>

  <cffunction name="setName" access="public"  output="false" hint="I set the Name into the variables.instance scope.">
    <cfargument name="Name" type="String" hint="I am the Name." />
      <cfset variables.instance.Name = arguments.Name />
  </cffunction>

  <!---
   * See Tax Types – can only be used on update calls
   * @return TaxType
  --->
  <cffunction name="getTaxType" access="public" output="false" hint="I return the TaxType">
    <cfreturn variables.instance.TaxType />
  </cffunction>

  <cffunction name="setTaxType" access="public"  output="false" hint="I set the TaxType into the variables.instance scope.">
    <cfargument name="TaxType" type="String" hint="I am the TaxType." />
      <cfset variables.instance.TaxType = arguments.TaxType />
  </cffunction>

  <!---
   * See TaxComponents
   * @return TaxComponents
  --->
  <cffunction name="getTaxComponents" access="public" output="false" hint="I return the TaxComponents">
    <cfreturn variables.instance.TaxComponents />
  </cffunction>

  <cffunction name="setTaxComponents" access="public"  output="false" hint="I set the TaxComponents into the variables.instance scope.">
    <cfargument name="TaxComponents" type="List[TaxComponent]" hint="I am the TaxComponents." />
      <cfset variables.instance.TaxComponents = arguments.TaxComponents />
  </cffunction>

  <!---
   * See Status Codes
   * @return Status
  --->
  <cffunction name="getStatus" access="public" output="false" hint="I return the Status">
    <cfreturn variables.instance.Status />
  </cffunction>

  <cffunction name="setStatus" access="public"  output="false" hint="I set the Status into the variables.instance scope.">
    <cfargument name="Status" type="StatusEnum" hint="I am the Status." />
      <cfset variables.instance.Status = arguments.Status />
  </cffunction>

  <!---
   * See ReportTaxTypes
   * @return ReportTaxType
  --->
  <cffunction name="getReportTaxType" access="public" output="false" hint="I return the ReportTaxType">
    <cfreturn variables.instance.ReportTaxType />
  </cffunction>

  <cffunction name="setReportTaxType" access="public"  output="false" hint="I set the ReportTaxType into the variables.instance scope.">
    <cfargument name="ReportTaxType" type="String" hint="I am the ReportTaxType." />
      <cfset variables.instance.ReportTaxType = arguments.ReportTaxType />
  </cffunction>

  <!---
   * Boolean to describe if tax rate can be used for asset accounts i.e. true,false
   * @return CanApplyToAssets
  --->
  <cffunction name="getCanApplyToAssets" access="public" output="false" hint="I return the CanApplyToAssets">
    <cfreturn variables.instance.CanApplyToAssets />
  </cffunction>

  <cffunction name="setCanApplyToAssets" access="public"  output="false" hint="I set the CanApplyToAssets into the variables.instance scope.">
    <cfargument name="CanApplyToAssets" type="BigDecimal" hint="I am the CanApplyToAssets." />
      <cfset variables.instance.CanApplyToAssets = arguments.CanApplyToAssets />
  </cffunction>

  <!---
   * Boolean to describe if tax rate can be used for equity accounts i.e. true,false
   * @return CanApplyToEquity
  --->
  <cffunction name="getCanApplyToEquity" access="public" output="false" hint="I return the CanApplyToEquity">
    <cfreturn variables.instance.CanApplyToEquity />
  </cffunction>

  <cffunction name="setCanApplyToEquity" access="public"  output="false" hint="I set the CanApplyToEquity into the variables.instance scope.">
    <cfargument name="CanApplyToEquity" type="BigDecimal" hint="I am the CanApplyToEquity." />
      <cfset variables.instance.CanApplyToEquity = arguments.CanApplyToEquity />
  </cffunction>

  <!---
   * Boolean to describe if tax rate can be used for expense accounts i.e. true,false
   * @return CanApplyToExpenses
  --->
  <cffunction name="getCanApplyToExpenses" access="public" output="false" hint="I return the CanApplyToExpenses">
    <cfreturn variables.instance.CanApplyToExpenses />
  </cffunction>

  <cffunction name="setCanApplyToExpenses" access="public"  output="false" hint="I set the CanApplyToExpenses into the variables.instance scope.">
    <cfargument name="CanApplyToExpenses" type="BigDecimal" hint="I am the CanApplyToExpenses." />
      <cfset variables.instance.CanApplyToExpenses = arguments.CanApplyToExpenses />
  </cffunction>

  <!---
   * Boolean to describe if tax rate can be used for liability accounts i.e. true,false
   * @return CanApplyToLiabilities
  --->
  <cffunction name="getCanApplyToLiabilities" access="public" output="false" hint="I return the CanApplyToLiabilities">
    <cfreturn variables.instance.CanApplyToLiabilities />
  </cffunction>

  <cffunction name="setCanApplyToLiabilities" access="public"  output="false" hint="I set the CanApplyToLiabilities into the variables.instance scope.">
    <cfargument name="CanApplyToLiabilities" type="BigDecimal" hint="I am the CanApplyToLiabilities." />
      <cfset variables.instance.CanApplyToLiabilities = arguments.CanApplyToLiabilities />
  </cffunction>

  <!---
   * Boolean to describe if tax rate can be used for revenue accounts i.e. true,false
   * @return CanApplyToRevenue
  --->
  <cffunction name="getCanApplyToRevenue" access="public" output="false" hint="I return the CanApplyToRevenue">
    <cfreturn variables.instance.CanApplyToRevenue />
  </cffunction>

  <cffunction name="setCanApplyToRevenue" access="public"  output="false" hint="I set the CanApplyToRevenue into the variables.instance scope.">
    <cfargument name="CanApplyToRevenue" type="BigDecimal" hint="I am the CanApplyToRevenue." />
      <cfset variables.instance.CanApplyToRevenue = arguments.CanApplyToRevenue />
  </cffunction>

  <!---
   * Tax Rate (decimal to 4dp) e.g 12.5000
   * @return DisplayTaxRate
  --->
  <cffunction name="getDisplayTaxRate" access="public" output="false" hint="I return the DisplayTaxRate">
    <cfreturn variables.instance.DisplayTaxRate />
  </cffunction>

  <cffunction name="setDisplayTaxRate" access="public"  output="false" hint="I set the DisplayTaxRate into the variables.instance scope.">
    <cfargument name="DisplayTaxRate" type="BigDecimal" hint="I am the DisplayTaxRate." />
      <cfset variables.instance.DisplayTaxRate = arguments.DisplayTaxRate />
  </cffunction>

  <!---
   * Effective Tax Rate (decimal to 4dp) e.g 12.5000
   * @return EffectiveRate
  --->
  <cffunction name="getEffectiveRate" access="public" output="false" hint="I return the EffectiveRate">
    <cfreturn variables.instance.EffectiveRate />
  </cffunction>

  <cffunction name="setEffectiveRate" access="public"  output="false" hint="I set the EffectiveRate into the variables.instance scope.">
    <cfargument name="EffectiveRate" type="BigDecimal" hint="I am the EffectiveRate." />
      <cfset variables.instance.EffectiveRate = arguments.EffectiveRate />
  </cffunction>



<cffunction name="getMemento" access="public"
  output="false" hint="I return a dumped struct of the
  variables.instance scope.">
  <cfreturn variables.instance />
</cffunction>

</cfcomponent>   
