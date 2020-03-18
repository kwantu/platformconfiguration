Data objects provide a rich context to define and encapsulate all business rules associated with the data.  This de-couples data and the business logic from the app logic.  For example:

* Hierarchies and sets can be used to describe the relationships between data fields in an DO.  This defines the context and the structure in one self-contained object. 
* Rules, help text, guidance and validations for each data field can be contained within the DO.  
* Each DO may be linked to other DOs to describe a network or wider business area. 
* DOs may be defined in multiple languages, with the labels for fields, help text and validations included in the DO 
* The DO includes a schema to validate the quality of the data published against the definition.  
* Data models that define the specific fields required and;
* DOs can include evidence (for example a photo, URL or document) that provides proof that an activity was completed for audit purposes.