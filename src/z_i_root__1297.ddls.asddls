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
     case orderstatus
          when 0 then  'New'
          when 1 then  'Cancel'
          when 2 then  'Processing'
          when 3 then  'Completed'      
      end as StatusText,
      @Semantics.imageUrl: true          
      'https://i0.wp.com/logaligroup.com/wp-content/uploads/2021/11/LOGALI_AZUL_DEGRADE_RGB_PNG-10.png?resize=823%2C800&ssl=1' as LogoURL, 
      @Semantics.imageUrl: true
      imageurl     as Imageurl,
      _Items
}
