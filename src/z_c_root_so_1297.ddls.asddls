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
      Imageurl,
      /* Associations */
      _Items

}
