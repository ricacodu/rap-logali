@EndUserText.label: 'Define Projection Items'
@AccessControl.authorizationCheck: #NOT_REQUIRED
@Metadata.allowExtensions: true
define view entity Z_C_ITEMS_SOR_1297 as projection on Z_I_ITEMS_SOR_1297
{
    key IdHeader,
    key Id,
    Name,
    Description,
    Releasedate,
    Discontinueddate,
    @Semantics.amount.currencyCode : 'Currency'
    Price,
    @Semantics.currencyCode: true
    currencycode     as Currency,
    @Semantics.quantity.unitOfMeasure : 'UnitOfMeasure'
    Height,
    @Semantics.quantity.unitOfMeasure : 'UnitOfMeasure'
    Width,
    @Semantics.quantity.unitOfMeasure : 'UnitOfMeasure'
    Depth,
    Quantity,
    @Semantics.unitOfMeasure: true
    Unitofmeasure,
    _UOM._DimensionText.UnitOfMeasureDimensionName as UnitOfMeasureText : localized,
    /* Associations */
    _Header : redirected to parent Z_C_root_so_1297
}
