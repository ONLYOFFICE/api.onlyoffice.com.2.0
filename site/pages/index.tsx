export function data() {
  return {
    title: "Welcome to ONLYOFFICE API",
    layout: "page"
  }
}

// ---
// title: Welcome to ONLYOFFICE API
// permalink: /index.html
// layout: blank/blank.11ty.js
// eleventyExcludeFromCollections: true
// ---
// <style webc:keep>
// .heading {
//   text-align: center;
// }

// .cards {
//   column-gap: 32px;
//   display: flex;
//   justify-content: space-between;
//   list-style: none;
//   margin: 64px 0 0 0;
//   padding: 0 24px;
// }

// .card__anchor {
//   color: hsl(0, 0%, 20%);
//   display: flex;
//   flex-direction: column;
//   font-size: 13px;
//   font-weight: 600;
//   text-decoration: none;
//   text-transform: uppercase;
//   align-items: center;
// }

// .card__anchor:hover,
// .card__anchor:focus {
//   color: hsl(15, 100%, 62%);
//   text-decoration: underline;
// }

// .card__anchor span:first-of-type {
//   display: block;
// }

// .card__anchor span:last-of-type {
//   display: block;
//   margin-top: 24px;
// }

// .sections {
//   align-items: flex-start;
//   display: flex;
//   flex-wrap: wrap;
//   gap: 32px;
//   margin-top: 75px;
// }

// .section {
//   /* width: calc(50% - 1px * 2 - 32px * 2 - 32px / 2); */
//   width: calc(50% - 32px / 2);
// }

// .product-card {
//   background-color: hsl(0, 0%, 100%);
//   border-radius: 3px;
//   border: 1px solid hsl(216, 15%, 94%);
//   box-shadow: 0px 7px 25px 0px hsl(0, 0%, 33%, 0.15);
//   padding: 32px;
//   /* padding: 32px 16px; */
// }

// .product-card__icon {
//   display: block;
// }

// .product-card__icon > svg {
//   display: block;
// }

// .product-card__title {
//   font-size: 18px;
//   font-weight: 700;
//   margin: 24px 0 0 0;
// }

// .product-card__description {
//   margin: 24px 0 0 0;
// }

// .product-card__more {
//   color: var(--color-scale-orange-0);
//   display: inline-block;
//   margin: 8px 0 0 0;
//   text-decoration: underline;
// }

// .product-card__more:hover,
// .product-card__more:focus {
//   color: inherit;
//   text-decoration: none;
// }

// .product-card-tree {
//   border-top: 1px solid var(--color-scale-gray-2);
//   display: grid;
//   gap: 24px;
//   grid-template-columns: repeat(3, 30%);
//   list-style: none;
//   margin: 24px 0 0 0;
//   padding: 24px 0 0 0;
// }

// .product-card-tree__title {
//   font-size: 12px;
//   font-weight: 700;
//   margin: 0;
//   text-transform: uppercase;
// }

// .product-card-subtree {
//   list-style: none;
//   margin: 12px 0 0 0;
//   padding-inline-start: 0;
//   display: block;
// }

// .product-card-subtree__item {
//   font-size: 12px;
//   margin-top: 8px;
//   overflow-x: hidden;
//   text-overflow: ellipsis;
//   white-space: nowrap;
// }

// .product-card-subtree__anchor {
//   color: inherit;
//   text-decoration: none;
// }

// .product-card-subtree__anchor:hover,
// .product-card-subtree__anchor:focus {
//   color: var(--color-scale-orange-0);
//   text-decoration: underline;
// }
// </style>
// <!-- <h1 class="heading" @text="title"></h1>
// <section>
//   <h2 class="sr-only"><l>All Products</l></h2>
//   <ul class="cards">
//     <li webc:for="p of collections.products">
//       <a class="card__anchor" :href="p.internal.url">
//         <span><is :@tag="p.internal.data.logo"></is></span>
//         <span @text="p.internal.data.title"></span>
//       </a>
//     </li>
//   </ul>
// </section>
// <o-masonry webc:if="collections.products.length > 0" class="sections">
//   <section webc:for="p of collections.products" class="section">
//     <div class="product-card">
//       <span class="product-card__icon"><is :@tag="p.internal.data.logo"></is></span>
//       <h2 class="product-card__title" @text="p.internal.data.title"></h2>
//       <p class="product-card__description" @text="p.internal.data.description"></p>
//       <a class="product-card__more" :href="p.internal.url">More</a>
//       <o-masonry webc:if="p.children.length > 0" class="product-card-tree" role="list">
//         <div webc:for="p of p.children" role="listitem">
//           <h3 class="product-card-tree__title" @text="p.internal.data.title"></h3>
//           <o-masonry webc:if="p.children.length > 0" class="product-card-subtree" role="list">
//             <div webc:for="p of p.children" class="product-card-subtree__item" role="listitem">
//               <a class="product-card-subtree__anchor" :href="p.internal.url" @text="p.internal.data.title"></a>
//             </div>
//           </o-masonry>
//         </div>
//       </o-masonry>
//     </div>
//   </section>
// </o-masonry> -->
