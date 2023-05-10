@AbapCatalog.sqlViewName: 'ZV_ROOT__1297'
@AbapCatalog.compiler.compareFilter: true
@AccessControl.authorizationCheck: #NOT_REQUIRED
@EndUserText.label: 'View Root Interface'
define root view Z_I_root__1297
  as select from zheaders_so_1297 as Header
  composition [0..*] of Z_I_ITEMS_SOR_1297 as _Items
{

  key idheader     as Idheader,
      email        as Email,
      firstname    as Firstname,
      lastname     as Lastname,
      country      as Country,
      @Semantics.user.createdBy: true
      createon     as Createon,
      deliverydate as Deliverydate,
      orderstatus  as Orderstatus,
      imageurl     as Imageurl,
      _Items
}
