<cfcomponent displayname="Invoice" output="false" extends="cfc.xeroclient"
  hint="I am the Invoice Class.">

<!--- PROPERTIES --->

  <cfproperty name="Type" type="String" default="" />
  <cfproperty name="LineItems" type="List[LineItem]" default="" />
  <cfproperty name="Date" type="String" default="" />
  <cfproperty name="DueDate" type="String" default="" />
  <cfproperty name="LineAmountTypes" type="LineAmountTypesEnum" default="" />
  <cfproperty name="InvoiceNumber" type="String" default="" />
  <cfproperty name="Reference" type="String" default="" />
  <cfproperty name="BrandingThemeID" type="String" default="" />
  <cfproperty name="Url" type="String" default="" />
  <cfproperty name="CurrencyCode" type="String" default="" />
  <cfproperty name="CurrencyRate" type="BigDecimal" default="" />
  <cfproperty name="Status" type="StatusEnum" default="" />
  <cfproperty name="SentToContact" type="Boolean" default="" />
  <cfproperty name="ExpectedPaymentDate" type="String" default="" />
  <cfproperty name="PlannedPaymentDate" type="String" default="" />
  <cfproperty name="SubTotal" type="BigDecimal" default="" />
  <cfproperty name="TotalTax" type="BigDecimal" default="" />
  <cfproperty name="Total" type="BigDecimal" default="" />
  <cfproperty name="TotalDiscount" type="BigDecimal" default="" />
  <cfproperty name="InvoiceID" type="String" default="" />
  <cfproperty name="HasAttachments" type="Boolean" default="" />
  <cfproperty name="Payments" type="List[Payment]" default="" />
  <cfproperty name="Prepayments" type="List[Prepayment]" default="" />
  <cfproperty name="Overpayments" type="List[Overpayment]" default="" />
  <cfproperty name="AmountDue" type="BigDecimal" default="" />
  <cfproperty name="AmountPaid" type="BigDecimal" default="" />
  <cfproperty name="FullyPaidOnDate" type="String" default="" />
  <cfproperty name="AmountCredited" type="BigDecimal" default="" />
  <cfproperty name="UpdatedDateUTC" type="String" default="" />
  <cfproperty name="CreditNotes" type="List[CreditNote]" default="" />

<!--- INIT --->
  <cffunction name="init" access="public" output="false"
    returntype="any" hint="I am the constructor method for the Invoice Class.">
      
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
  
  <cffunction name="toStruct" access="public" output="false">
        <cfscript>
          myStruct=StructNew();
          myStruct=this.toJSON(returnType="struct");
        </cfscript>
    <cfreturn myStruct />
  </cffunction>

  <cffunction name="toJSON" access="public" output="false">
     <cfargument name="exclude" type="String" default="" hint="I am a list of attributes to exclude from JSON payload" />
     <cfargument name="archive" type="boolean" default="false" hint="I flag to return only the req. fields as JSON payload for archiving an object" />
     <cfargument name="returnType" type="String" default="json" hint="I set how the data is returned" />
     
        <cfscript>
          myStruct=StructNew();
          if (archive) {
            myStruct.InvoiceID=getInvoiceID();
            myStruct.Status=getStatus();
          } else {

            if (structKeyExists(variables.instance,"Type")) {
              if (NOT listFindNoCase(arguments.exclude, "Type")) {
                myStruct.Type=getType();
              }
            }
            if (structKeyExists(variables.instance,"LineItems")) {
              if (NOT listFindNoCase(arguments.exclude, "LineItems")) {
                myStruct.LineItems=getLineItems();
              }
            }
            if (structKeyExists(variables.instance,"Date")) {
              if (NOT listFindNoCase(arguments.exclude, "Date")) {
                myStruct.Date=getDate();
              }
            }
            if (structKeyExists(variables.instance,"DueDate")) {
              if (NOT listFindNoCase(arguments.exclude, "DueDate")) {
                myStruct.DueDate=getDueDate();
              }
            }
            if (structKeyExists(variables.instance,"LineAmountTypes")) {
              if (NOT listFindNoCase(arguments.exclude, "LineAmountTypes")) {
                myStruct.LineAmountTypes=getLineAmountTypes();
              }
            }
            if (structKeyExists(variables.instance,"InvoiceNumber")) {
              if (NOT listFindNoCase(arguments.exclude, "InvoiceNumber")) {
                myStruct.InvoiceNumber=getInvoiceNumber();
              }
            }
            if (structKeyExists(variables.instance,"Reference")) {
              if (NOT listFindNoCase(arguments.exclude, "Reference")) {
                myStruct.Reference=getReference();
              }
            }
            if (structKeyExists(variables.instance,"BrandingThemeID")) {
              if (NOT listFindNoCase(arguments.exclude, "BrandingThemeID")) {
                myStruct.BrandingThemeID=getBrandingThemeID();
              }
            }
            if (structKeyExists(variables.instance,"Url")) {
              if (NOT listFindNoCase(arguments.exclude, "Url")) {
                myStruct.Url=getUrl();
              }
            }
            if (structKeyExists(variables.instance,"CurrencyCode")) {
              if (NOT listFindNoCase(arguments.exclude, "CurrencyCode")) {
                myStruct.CurrencyCode=getCurrencyCode();
              }
            }
            if (structKeyExists(variables.instance,"CurrencyRate")) {
              if (NOT listFindNoCase(arguments.exclude, "CurrencyRate")) {
                myStruct.CurrencyRate=getCurrencyRate();
              }
            }
            if (structKeyExists(variables.instance,"Status")) {
              if (NOT listFindNoCase(arguments.exclude, "Status")) {
                myStruct.Status=getStatus();
              }
            }
            if (structKeyExists(variables.instance,"SentToContact")) {
              if (NOT listFindNoCase(arguments.exclude, "SentToContact")) {
                myStruct.SentToContact=getSentToContact();
              }
            }
            if (structKeyExists(variables.instance,"ExpectedPaymentDate")) {
              if (NOT listFindNoCase(arguments.exclude, "ExpectedPaymentDate")) {
                myStruct.ExpectedPaymentDate=getExpectedPaymentDate();
              }
            }
            if (structKeyExists(variables.instance,"PlannedPaymentDate")) {
              if (NOT listFindNoCase(arguments.exclude, "PlannedPaymentDate")) {
                myStruct.PlannedPaymentDate=getPlannedPaymentDate();
              }
            }
            if (structKeyExists(variables.instance,"SubTotal")) {
              if (NOT listFindNoCase(arguments.exclude, "SubTotal")) {
                myStruct.SubTotal=getSubTotal();
              }
            }
            if (structKeyExists(variables.instance,"TotalTax")) {
              if (NOT listFindNoCase(arguments.exclude, "TotalTax")) {
                myStruct.TotalTax=getTotalTax();
              }
            }
            if (structKeyExists(variables.instance,"Total")) {
              if (NOT listFindNoCase(arguments.exclude, "Total")) {
                myStruct.Total=getTotal();
              }
            }
            if (structKeyExists(variables.instance,"TotalDiscount")) {
              if (NOT listFindNoCase(arguments.exclude, "TotalDiscount")) {
                myStruct.TotalDiscount=getTotalDiscount();
              }
            }
            if (structKeyExists(variables.instance,"InvoiceID")) {
              if (NOT listFindNoCase(arguments.exclude, "InvoiceID")) {
                myStruct.InvoiceID=getInvoiceID();
              }
            }
            if (structKeyExists(variables.instance,"HasAttachments")) {
              if (NOT listFindNoCase(arguments.exclude, "HasAttachments")) {
                myStruct.HasAttachments=getHasAttachments();
              }
            }
            if (structKeyExists(variables.instance,"Payments")) {
              if (NOT listFindNoCase(arguments.exclude, "Payments")) {
                myStruct.Payments=getPayments();
              }
            }
            if (structKeyExists(variables.instance,"Prepayments")) {
              if (NOT listFindNoCase(arguments.exclude, "Prepayments")) {
                myStruct.Prepayments=getPrepayments();
              }
            }
            if (structKeyExists(variables.instance,"Overpayments")) {
              if (NOT listFindNoCase(arguments.exclude, "Overpayments")) {
                myStruct.Overpayments=getOverpayments();
              }
            }
            if (structKeyExists(variables.instance,"AmountDue")) {
              if (NOT listFindNoCase(arguments.exclude, "AmountDue")) {
                myStruct.AmountDue=getAmountDue();
              }
            }
            if (structKeyExists(variables.instance,"AmountPaid")) {
              if (NOT listFindNoCase(arguments.exclude, "AmountPaid")) {
                myStruct.AmountPaid=getAmountPaid();
              }
            }
            if (structKeyExists(variables.instance,"FullyPaidOnDate")) {
              if (NOT listFindNoCase(arguments.exclude, "FullyPaidOnDate")) {
                myStruct.FullyPaidOnDate=getFullyPaidOnDate();
              }
            }
            if (structKeyExists(variables.instance,"AmountCredited")) {
              if (NOT listFindNoCase(arguments.exclude, "AmountCredited")) {
                myStruct.AmountCredited=getAmountCredited();
              }
            }
            if (structKeyExists(variables.instance,"UpdatedDateUTC")) {
              if (NOT listFindNoCase(arguments.exclude, "UpdatedDateUTC")) {
                myStruct.UpdatedDateUTC=getUpdatedDateUTC();
              }
            }
            if (structKeyExists(variables.instance,"CreditNotes")) {
              if (NOT listFindNoCase(arguments.exclude, "CreditNotes")) {
                myStruct.CreditNotes=getCreditNotes();
              }
            }
          }
        </cfscript>

    <cfif returnType EQ "Struct">
       <cfreturn myStruct />
    <cfelse>
      <cfset variables.jsonObj = serializeJSON(myStruct)>
      <cfreturn variables.jsonObj />
    </cfif>
  </cffunction>

  <cffunction name="populate" access="public" output="false">
     <cfargument name="objects" required="true" type="struct" default="" hint="I am a structure of this object." />

        <cfset obj = arguments.objects>
        <cfscript>

        if (structKeyExists(obj,"Type")) {
          setType(obj.Type);
        } else {
          setType("");
        }
        if (structKeyExists(obj,"LineItems")) {
          setLineItems(obj.LineItems);
        } else {
          setLineItems("");
        }
        if (structKeyExists(obj,"Date")) {
          setDate(obj.Date);
        } else {
          setDate("");
        }
        if (structKeyExists(obj,"DueDate")) {
          setDueDate(obj.DueDate);
        } else {
          setDueDate("");
        }
        if (structKeyExists(obj,"LineAmountTypes")) {
          setLineAmountTypes(obj.LineAmountTypes);
        } else {
          setLineAmountTypes("");
        }
        if (structKeyExists(obj,"InvoiceNumber")) {
          setInvoiceNumber(obj.InvoiceNumber);
        } else {
          setInvoiceNumber("");
        }
        if (structKeyExists(obj,"Reference")) {
          setReference(obj.Reference);
        } else {
          setReference("");
        }
        if (structKeyExists(obj,"BrandingThemeID")) {
          setBrandingThemeID(obj.BrandingThemeID);
        } else {
          setBrandingThemeID("");
        }
        if (structKeyExists(obj,"Url")) {
          setUrl(obj.Url);
        } else {
          setUrl("");
        }
        if (structKeyExists(obj,"CurrencyCode")) {
          setCurrencyCode(obj.CurrencyCode);
        } else {
          setCurrencyCode("");
        }
        if (structKeyExists(obj,"CurrencyRate")) {
          setCurrencyRate(obj.CurrencyRate);
        } else {
          setCurrencyRate("");
        }
        if (structKeyExists(obj,"Status")) {
          setStatus(obj.Status);
        } else {
          setStatus("");
        }
        if (structKeyExists(obj,"SentToContact")) {
          setSentToContact(obj.SentToContact);
        } else {
          setSentToContact("");
        }
        if (structKeyExists(obj,"ExpectedPaymentDate")) {
          setExpectedPaymentDate(obj.ExpectedPaymentDate);
        } else {
          setExpectedPaymentDate("");
        }
        if (structKeyExists(obj,"PlannedPaymentDate")) {
          setPlannedPaymentDate(obj.PlannedPaymentDate);
        } else {
          setPlannedPaymentDate("");
        }
        if (structKeyExists(obj,"SubTotal")) {
          setSubTotal(obj.SubTotal);
        } else {
          setSubTotal("");
        }
        if (structKeyExists(obj,"TotalTax")) {
          setTotalTax(obj.TotalTax);
        } else {
          setTotalTax("");
        }
        if (structKeyExists(obj,"Total")) {
          setTotal(obj.Total);
        } else {
          setTotal("");
        }
        if (structKeyExists(obj,"TotalDiscount")) {
          setTotalDiscount(obj.TotalDiscount);
        } else {
          setTotalDiscount("");
        }
        if (structKeyExists(obj,"InvoiceID")) {
          setInvoiceID(obj.InvoiceID);
        } else {
          setInvoiceID("");
        }
        if (structKeyExists(obj,"HasAttachments")) {
          setHasAttachments(obj.HasAttachments);
        } else {
          setHasAttachments("");
        }
        if (structKeyExists(obj,"Payments")) {
          setPayments(obj.Payments);
        } else {
          setPayments("");
        }
        if (structKeyExists(obj,"Prepayments")) {
          setPrepayments(obj.Prepayments);
        } else {
          setPrepayments("");
        }
        if (structKeyExists(obj,"Overpayments")) {
          setOverpayments(obj.Overpayments);
        } else {
          setOverpayments("");
        }
        if (structKeyExists(obj,"AmountDue")) {
          setAmountDue(obj.AmountDue);
        } else {
          setAmountDue("");
        }
        if (structKeyExists(obj,"AmountPaid")) {
          setAmountPaid(obj.AmountPaid);
        } else {
          setAmountPaid("");
        }
        if (structKeyExists(obj,"FullyPaidOnDate")) {
          setFullyPaidOnDate(obj.FullyPaidOnDate);
        } else {
          setFullyPaidOnDate("");
        }
        if (structKeyExists(obj,"AmountCredited")) {
          setAmountCredited(obj.AmountCredited);
        } else {
          setAmountCredited("");
        }
        if (structKeyExists(obj,"UpdatedDateUTC")) {
          setUpdatedDateUTC(obj.UpdatedDateUTC);
        } else {
          setUpdatedDateUTC("");
        }
        if (structKeyExists(obj,"CreditNotes")) {
          setCreditNotes(obj.CreditNotes);
        } else {
          setCreditNotes("");
        }
      </cfscript>
      
   <cfreturn this />
  </cffunction>

  <cffunction name="getAll" access="public" returntype="any">
    <cfargument name="ifModifiedSince"  type="string" default="">
      <cfset this.setList(this.get(endpoint="Invoices"))>
    <cfreturn this>
  </cffunction>

  <cffunction name="getById" access="public" returntype="any">
    <cfargument name="id"  type="string" default="">
    
    <cfset var ArrayResult = this.get(endpoint="Invoices",id=id)>
    <cfscript>
      this.populate(ArrayResult[1]);
    </cfscript>

    <cfreturn this>
  </cffunction>

  <cffunction name="create" access="public" output="false">
    <cfset variables.result = Super.put(endpoint="Invoices",body=this.toJSON())>
    
    <cfloop from="1" to="#ArrayLen(variables.result)#" index="i">
      <cfset temp = this.populate(variables.result[i])>
    </cfloop>

    <cfreturn this />
  </cffunction>

  <cffunction name="update" access="public" output="false">
    <cfset variables.result = Super.post(endpoint="Invoices",body=this.toJSON(),id=this.getInvoiceID())>
    
    <cfloop from="1" to="#ArrayLen(variables.result)#" index="i">
      <cfset temp = this.populate(variables.result[i])>
    </cfloop>

    <cfreturn this />
  </cffunction>

  <cffunction name="archive" access="public" output="false">
    <cfset variables.result = Super.post(endpoint="Invoices",body=this.toJSON(archive=true),id=this.getInvoiceID())>
    
    <cfloop from="1" to="#ArrayLen(variables.result)#" index="i">
      <cfset temp = this.populate(variables.result[i])>
    </cfloop>

    <cfreturn this />
  </cffunction>

  <cffunction name="delete" access="public" output="false">
    <cfset variables.result = Super.delete(endpoint="Invoices",body=this.toJSON(),id=this.getInvoiceID())>
    
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

  <cffunction name="setList" access="public"  output="false" hint="I set the array of Invoices">
    <cfargument name="list" type="Array" hint="I am the list." />
      <cfset this.list = arguments.list />
  </cffunction>

  <cffunction name="getList" access="public" output="false" hint="I return the array of Invoices">
    <cfreturn this.list />
  </cffunction>

<!--- GETTER / SETTER  --->

  <!---
   * See Invoice Types
   * @return Type
  --->
  <cffunction name="getType" access="public" output="false" hint="I return the Type">
    <cfreturn variables.instance.Type />
  </cffunction>

  <cffunction name="setType" access="public"  output="false" hint="I set the Type into the variables.instance scope.">
    <cfargument name="Type" type="String" hint="I am the Type." />
      <cfset variables.instance.Type = arguments.Type />
  </cffunction>

  <!---
   * See LineItems
   * @return LineItems
  --->
  <cffunction name="getLineItems" access="public" output="false" hint="I return the LineItems">
    <cfreturn variables.instance.LineItems />
  </cffunction>

  <cffunction name="setLineItems" access="public"  output="false" hint="I set the LineItems into the variables.instance scope.">
    <cfargument name="LineItems" type="List[LineItem]" hint="I am the LineItems." />
      <cfset variables.instance.LineItems = arguments.LineItems />
  </cffunction>

  <!---
   * Date invoice was issued – YYYY-MM-DD. If the Date element is not specified it will default to the current date based on the timezone setting of the organisation
   * @return Date
  --->
  <cffunction name="getDate" access="public" output="false" hint="I return the Date">
    <cfreturn variables.instance.Date />
  </cffunction>

  <cffunction name="setDate" access="public"  output="false" hint="I set the Date into the variables.instance scope.">
    <cfargument name="Date" type="String" hint="I am the Date." />
      <cfset variables.instance.Date = arguments.Date />
  </cffunction>

  <!---
   * Date invoice is due – YYYY-MM-DD
   * @return DueDate
  --->
  <cffunction name="getDueDate" access="public" output="false" hint="I return the DueDate">
    <cfreturn variables.instance.DueDate />
  </cffunction>

  <cffunction name="setDueDate" access="public"  output="false" hint="I set the DueDate into the variables.instance scope.">
    <cfargument name="DueDate" type="String" hint="I am the DueDate." />
      <cfset variables.instance.DueDate = arguments.DueDate />
  </cffunction>

  <!---
   * Line amounts are exclusive of tax by default if you don’t specify this element. See Line Amount Types
   * @return LineAmountTypes
  --->
  <cffunction name="getLineAmountTypes" access="public" output="false" hint="I return the LineAmountTypes">
    <cfreturn variables.instance.LineAmountTypes />
  </cffunction>

  <cffunction name="setLineAmountTypes" access="public"  output="false" hint="I set the LineAmountTypes into the variables.instance scope.">
    <cfargument name="LineAmountTypes" type="LineAmountTypesEnum" hint="I am the LineAmountTypes." />
      <cfset variables.instance.LineAmountTypes = arguments.LineAmountTypes />
  </cffunction>

  <!---
   * ACCREC – Unique alpha numeric code identifying invoice (when missing will auto-generate from your Organisation Invoice Settings) (max length = 255)
   * @return InvoiceNumber
  --->
  <cffunction name="getInvoiceNumber" access="public" output="false" hint="I return the InvoiceNumber">
    <cfreturn variables.instance.InvoiceNumber />
  </cffunction>

  <cffunction name="setInvoiceNumber" access="public"  output="false" hint="I set the InvoiceNumber into the variables.instance scope.">
    <cfargument name="InvoiceNumber" type="String" hint="I am the InvoiceNumber." />
      <cfset variables.instance.InvoiceNumber = arguments.InvoiceNumber />
  </cffunction>

  <!---
   * ACCREC only – additional reference number (max length = 255)
   * @return Reference
  --->
  <cffunction name="getReference" access="public" output="false" hint="I return the Reference">
    <cfreturn variables.instance.Reference />
  </cffunction>

  <cffunction name="setReference" access="public"  output="false" hint="I set the Reference into the variables.instance scope.">
    <cfargument name="Reference" type="String" hint="I am the Reference." />
      <cfset variables.instance.Reference = arguments.Reference />
  </cffunction>

  <!---
   * See BrandingThemes
   * @return BrandingThemeID
  --->
  <cffunction name="getBrandingThemeID" access="public" output="false" hint="I return the BrandingThemeID">
    <cfreturn variables.instance.BrandingThemeID />
  </cffunction>

  <cffunction name="setBrandingThemeID" access="public"  output="false" hint="I set the BrandingThemeID into the variables.instance scope.">
    <cfargument name="BrandingThemeID" type="String" hint="I am the BrandingThemeID." />
      <cfset variables.instance.BrandingThemeID = arguments.BrandingThemeID />
  </cffunction>

  <!---
   * URL link to a source document – shown as “Go to [appName]” in the Xero app
   * @return Url
  --->
  <cffunction name="getUrl" access="public" output="false" hint="I return the Url">
    <cfreturn variables.instance.Url />
  </cffunction>

  <cffunction name="setUrl" access="public"  output="false" hint="I set the Url into the variables.instance scope.">
    <cfargument name="Url" type="String" hint="I am the Url." />
      <cfset variables.instance.Url = arguments.Url />
  </cffunction>

  <!---
   * The currency that invoice has been raised in (see Currencies)
   * @return CurrencyCode
  --->
  <cffunction name="getCurrencyCode" access="public" output="false" hint="I return the CurrencyCode">
    <cfreturn variables.instance.CurrencyCode />
  </cffunction>

  <cffunction name="setCurrencyCode" access="public"  output="false" hint="I set the CurrencyCode into the variables.instance scope.">
    <cfargument name="CurrencyCode" type="String" hint="I am the CurrencyCode." />
      <cfset variables.instance.CurrencyCode = arguments.CurrencyCode />
  </cffunction>

  <!---
   * The currency rate for a multicurrency invoice. If no rate is specified, the XE.com day rate is used. (max length = [18].[6])
   * @return CurrencyRate
  --->
  <cffunction name="getCurrencyRate" access="public" output="false" hint="I return the CurrencyRate">
    <cfreturn variables.instance.CurrencyRate />
  </cffunction>

  <cffunction name="setCurrencyRate" access="public"  output="false" hint="I set the CurrencyRate into the variables.instance scope.">
    <cfargument name="CurrencyRate" type="BigDecimal" hint="I am the CurrencyRate." />
      <cfset variables.instance.CurrencyRate = arguments.CurrencyRate />
  </cffunction>

  <!---
   * See Invoice Status Codes
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
   * Boolean to set whether the invoice in the Xero app should be marked as “sent”. This can be set only on invoices that have been approved
   * @return SentToContact
  --->
  <cffunction name="getSentToContact" access="public" output="false" hint="I return the SentToContact">
    <cfreturn variables.instance.SentToContact />
  </cffunction>

  <cffunction name="setSentToContact" access="public"  output="false" hint="I set the SentToContact into the variables.instance scope.">
    <cfargument name="SentToContact" type="Boolean" hint="I am the SentToContact." />
      <cfset variables.instance.SentToContact = arguments.SentToContact />
  </cffunction>

  <!---
   * Shown on sales invoices (Accounts Receivable) when this has been set
   * @return ExpectedPaymentDate
  --->
  <cffunction name="getExpectedPaymentDate" access="public" output="false" hint="I return the ExpectedPaymentDate">
    <cfreturn variables.instance.ExpectedPaymentDate />
  </cffunction>

  <cffunction name="setExpectedPaymentDate" access="public"  output="false" hint="I set the ExpectedPaymentDate into the variables.instance scope.">
    <cfargument name="ExpectedPaymentDate" type="String" hint="I am the ExpectedPaymentDate." />
      <cfset variables.instance.ExpectedPaymentDate = arguments.ExpectedPaymentDate />
  </cffunction>

  <!---
   * Shown on bills (Accounts Payable) when this has been set
   * @return PlannedPaymentDate
  --->
  <cffunction name="getPlannedPaymentDate" access="public" output="false" hint="I return the PlannedPaymentDate">
    <cfreturn variables.instance.PlannedPaymentDate />
  </cffunction>

  <cffunction name="setPlannedPaymentDate" access="public"  output="false" hint="I set the PlannedPaymentDate into the variables.instance scope.">
    <cfargument name="PlannedPaymentDate" type="String" hint="I am the PlannedPaymentDate." />
      <cfset variables.instance.PlannedPaymentDate = arguments.PlannedPaymentDate />
  </cffunction>

  <!---
   * Total of invoice excluding taxes
   * @return SubTotal
  --->
  <cffunction name="getSubTotal" access="public" output="false" hint="I return the SubTotal">
    <cfreturn variables.instance.SubTotal />
  </cffunction>

  <cffunction name="setSubTotal" access="public"  output="false" hint="I set the SubTotal into the variables.instance scope.">
    <cfargument name="SubTotal" type="BigDecimal" hint="I am the SubTotal." />
      <cfset variables.instance.SubTotal = arguments.SubTotal />
  </cffunction>

  <!---
   * Total tax on invoice
   * @return TotalTax
  --->
  <cffunction name="getTotalTax" access="public" output="false" hint="I return the TotalTax">
    <cfreturn variables.instance.TotalTax />
  </cffunction>

  <cffunction name="setTotalTax" access="public"  output="false" hint="I set the TotalTax into the variables.instance scope.">
    <cfargument name="TotalTax" type="BigDecimal" hint="I am the TotalTax." />
      <cfset variables.instance.TotalTax = arguments.TotalTax />
  </cffunction>

  <!---
   * Total of Invoice tax inclusive (i.e. SubTotal + TotalTax). This will be ignored if it doesn’t equal the sum of the LineAmounts
   * @return Total
  --->
  <cffunction name="getTotal" access="public" output="false" hint="I return the Total">
    <cfreturn variables.instance.Total />
  </cffunction>

  <cffunction name="setTotal" access="public"  output="false" hint="I set the Total into the variables.instance scope.">
    <cfargument name="Total" type="BigDecimal" hint="I am the Total." />
      <cfset variables.instance.Total = arguments.Total />
  </cffunction>

  <!---
   * Total of discounts applied on the invoice line items
   * @return TotalDiscount
  --->
  <cffunction name="getTotalDiscount" access="public" output="false" hint="I return the TotalDiscount">
    <cfreturn variables.instance.TotalDiscount />
  </cffunction>

  <cffunction name="setTotalDiscount" access="public"  output="false" hint="I set the TotalDiscount into the variables.instance scope.">
    <cfargument name="TotalDiscount" type="BigDecimal" hint="I am the TotalDiscount." />
      <cfset variables.instance.TotalDiscount = arguments.TotalDiscount />
  </cffunction>

  <!---
   * Xero generated unique identifier for invoice
   * @return InvoiceID
  --->
  <cffunction name="getInvoiceID" access="public" output="false" hint="I return the InvoiceID">
    <cfreturn variables.instance.InvoiceID />
  </cffunction>

  <cffunction name="setInvoiceID" access="public"  output="false" hint="I set the InvoiceID into the variables.instance scope.">
    <cfargument name="InvoiceID" type="String" hint="I am the InvoiceID." />
      <cfset variables.instance.InvoiceID = arguments.InvoiceID />
  </cffunction>

  <!---
   * boolean to indicate if an invoice has an attachment
   * @return HasAttachments
  --->
  <cffunction name="getHasAttachments" access="public" output="false" hint="I return the HasAttachments">
    <cfreturn variables.instance.HasAttachments />
  </cffunction>

  <cffunction name="setHasAttachments" access="public"  output="false" hint="I set the HasAttachments into the variables.instance scope.">
    <cfargument name="HasAttachments" type="Boolean" hint="I am the HasAttachments." />
      <cfset variables.instance.HasAttachments = arguments.HasAttachments />
  </cffunction>

  <!---
   * See Payments
   * @return Payments
  --->
  <cffunction name="getPayments" access="public" output="false" hint="I return the Payments">
    <cfreturn variables.instance.Payments />
  </cffunction>

  <cffunction name="setPayments" access="public"  output="false" hint="I set the Payments into the variables.instance scope.">
    <cfargument name="Payments" type="List[Payment]" hint="I am the Payments." />
      <cfset variables.instance.Payments = arguments.Payments />
  </cffunction>

  <!---
   * See Prepayments
   * @return Prepayments
  --->
  <cffunction name="getPrepayments" access="public" output="false" hint="I return the Prepayments">
    <cfreturn variables.instance.Prepayments />
  </cffunction>

  <cffunction name="setPrepayments" access="public"  output="false" hint="I set the Prepayments into the variables.instance scope.">
    <cfargument name="Prepayments" type="List[Prepayment]" hint="I am the Prepayments." />
      <cfset variables.instance.Prepayments = arguments.Prepayments />
  </cffunction>

  <!---
   * See Overpayments
   * @return Overpayments
  --->
  <cffunction name="getOverpayments" access="public" output="false" hint="I return the Overpayments">
    <cfreturn variables.instance.Overpayments />
  </cffunction>

  <cffunction name="setOverpayments" access="public"  output="false" hint="I set the Overpayments into the variables.instance scope.">
    <cfargument name="Overpayments" type="List[Overpayment]" hint="I am the Overpayments." />
      <cfset variables.instance.Overpayments = arguments.Overpayments />
  </cffunction>

  <!---
   * Amount remaining to be paid on invoice
   * @return AmountDue
  --->
  <cffunction name="getAmountDue" access="public" output="false" hint="I return the AmountDue">
    <cfreturn variables.instance.AmountDue />
  </cffunction>

  <cffunction name="setAmountDue" access="public"  output="false" hint="I set the AmountDue into the variables.instance scope.">
    <cfargument name="AmountDue" type="BigDecimal" hint="I am the AmountDue." />
      <cfset variables.instance.AmountDue = arguments.AmountDue />
  </cffunction>

  <!---
   * Sum of payments received for invoice
   * @return AmountPaid
  --->
  <cffunction name="getAmountPaid" access="public" output="false" hint="I return the AmountPaid">
    <cfreturn variables.instance.AmountPaid />
  </cffunction>

  <cffunction name="setAmountPaid" access="public"  output="false" hint="I set the AmountPaid into the variables.instance scope.">
    <cfargument name="AmountPaid" type="BigDecimal" hint="I am the AmountPaid." />
      <cfset variables.instance.AmountPaid = arguments.AmountPaid />
  </cffunction>

  <!---
   * The date the invoice was fully paid. Only returned on fully paid invoices
   * @return FullyPaidOnDate
  --->
  <cffunction name="getFullyPaidOnDate" access="public" output="false" hint="I return the FullyPaidOnDate">
    <cfreturn variables.instance.FullyPaidOnDate />
  </cffunction>

  <cffunction name="setFullyPaidOnDate" access="public"  output="false" hint="I set the FullyPaidOnDate into the variables.instance scope.">
    <cfargument name="FullyPaidOnDate" type="String" hint="I am the FullyPaidOnDate." />
      <cfset variables.instance.FullyPaidOnDate = arguments.FullyPaidOnDate />
  </cffunction>

  <!---
   * Sum of all credit notes, over-payments and pre-payments applied to invoice
   * @return AmountCredited
  --->
  <cffunction name="getAmountCredited" access="public" output="false" hint="I return the AmountCredited">
    <cfreturn variables.instance.AmountCredited />
  </cffunction>

  <cffunction name="setAmountCredited" access="public"  output="false" hint="I set the AmountCredited into the variables.instance scope.">
    <cfargument name="AmountCredited" type="BigDecimal" hint="I am the AmountCredited." />
      <cfset variables.instance.AmountCredited = arguments.AmountCredited />
  </cffunction>

  <!---
   * Last modified date UTC format
   * @return UpdatedDateUTC
  --->
  <cffunction name="getUpdatedDateUTC" access="public" output="false" hint="I return the UpdatedDateUTC">
    <cfreturn variables.instance.UpdatedDateUTC />
  </cffunction>

  <cffunction name="setUpdatedDateUTC" access="public"  output="false" hint="I set the UpdatedDateUTC into the variables.instance scope.">
    <cfargument name="UpdatedDateUTC" type="String" hint="I am the UpdatedDateUTC." />
      <cfset variables.instance.UpdatedDateUTC = arguments.UpdatedDateUTC />
  </cffunction>

  <!---
   * Details of credit notes that have been applied to an invoice
   * @return CreditNotes
  --->
  <cffunction name="getCreditNotes" access="public" output="false" hint="I return the CreditNotes">
    <cfreturn variables.instance.CreditNotes />
  </cffunction>

  <cffunction name="setCreditNotes" access="public"  output="false" hint="I set the CreditNotes into the variables.instance scope.">
    <cfargument name="CreditNotes" type="List[CreditNote]" hint="I am the CreditNotes." />
      <cfset variables.instance.CreditNotes = arguments.CreditNotes />
  </cffunction>



<cffunction name="getMemento" access="public"
  output="false" hint="I return a dumped struct of the
  variables.instance scope.">
  <cfreturn variables.instance />
</cffunction>

</cfcomponent>   
