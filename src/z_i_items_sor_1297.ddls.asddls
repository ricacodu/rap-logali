@AbapCatalog.sqlViewName: 'ZV_ITEMS_SO_1297'
@AbapCatalog.compiler.compareFilter: true
@AccessControl.authorizationCheck: #NOT_REQUIRED
@EndUserText.label: 'View type Interface for Items SO'
define view Z_I_ITEMS_SOR_1297
  as select from zitems_so_1297 as Items
  association to parent Z_I_root__1297  as _Header on $projection.IdHeader = _Header.Idheader
  association [0..1] to I_Currency      as _Currency on $projection.currencycode = _Currency.Currency
  association [0..1] to I_UnitOfMeasure as _UOM on $projection.Unitofmeasure = _UOM.UnitOfMeasure
{
  key idheader         as IdHeader,
  key id               as Id,
      name             as Name,
      description      as Description,
      releasedate      as Releasedate,
      discontinueddate as Discontinueddate,
      @Semantics.amount.currencyCode : 'currencycode'
      price            as Price,
      @Semantics.currencyCode: true
      currencycode,
      @Semantics.quantity.unitOfMeasure : 'unitofmeasure'
      height           as Height,
      @Semantics.quantity.unitOfMeasure : 'unitofmeasure'
      width            as Width,
      @Semantics.quantity.unitOfMeasure : 'unitofmeasure'
      depth            as Depth,
      quantity         as Quantity,
      @Semantics.unitOfMeasure: true
      unitofmeasure    as Unitofmeasure,
     _Header, 
     _Currency,
     _UOM
}
