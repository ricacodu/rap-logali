@AbapCatalog.sqlViewName: 'ZV_ITEMS_SO_1297'
@AbapCatalog.compiler.compareFilter: true
@AccessControl.authorizationCheck: #NOT_REQUIRED
@EndUserText.label: 'View type Interface for Items SO'
define view Z_I_ITEMS_SOR_1297
  as select from zitems_so_1297 as Items
  association to parent Z_I_root__1297 as _Header on $projection.IdHeader = _Header.Idheader
{
  key idheader         as IdHeader,
  key id               as Id,
      name             as Name,
      description      as Description,
      releasedate      as Releasedate,
      discontinueddate as Discontinueddate,
      price            as Price,
      @Semantics.quantity.unitOfMeasure : 'unitofmeasure'
      height           as Height,
      @Semantics.quantity.unitOfMeasure : 'unitofmeasure'
      width            as Width,
      depth            as Depth,
      quantity         as Quantity,
      unitofmeasure    as Unitofmeasure,
     _Header
}
