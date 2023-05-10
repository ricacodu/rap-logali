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
    Price,
    Height,
    Width,
    Depth,
    Quantity,
    Unitofmeasure,
    /* Associations */
    _Header : redirected to parent Z_C_root_so_1297
}
