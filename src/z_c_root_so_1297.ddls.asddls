@EndUserText.label: 'Projection View Root'
@AccessControl.authorizationCheck: #NOT_REQUIRED
@Metadata.allowExtensions: true
define root view entity Z_C_root_so_1297
  as projection on Z_I_root__1297
{
  key Idheader,
      Email,
      Firstname,
      Lastname,
      Country,
      Createon,
      Deliverydate,
      Orderstatus,
      StatusText   as StatusText,     
      @Semantics.imageUrl: true    
      LogoURL      as LogoURL,
      @Semantics.imageUrl: true
      Imageurl,
      /* Associations */
      _Items : redirected to composition child Z_C_ITEMS_SOR_1297

}
