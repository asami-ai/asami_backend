
class AsamiFlows {
  static const String version = "3.0";

  /// Complete Signup Flow
  static Map<String, dynamic> get signupFlow => {
        "signup_flow": {
          "version": version,
          "screens": _signupScreens,
        }
      };

  /// Complete Product Creation Flow
  static Map<String, dynamic> get productCreationFlow => {
        "product_creation_flow": {
          "version": version,
          "screens": _productCreationScreens,
        }
      };

  /// Complete Checkout Flow
  static Map<String, dynamic> get checkoutFlow => {
        "checkout_flow": {
          "version": version,
          "screens": _checkoutScreens,
        }
      };

  // ====================== SIGNUP FLOW SCREENS ======================
  static final List<Map<String, dynamic>> _signupScreens = [
    {
      "id": "USER_TYPE_SELECTION",
      "title": "Welcome to Asami",
      "data": {},
      "layout": {
        "type": "SingleColumnLayout",
        "children": [
          {"type": "TextHeading", "text": "How would you like to use Asami?"},
          {
            "type": "TextBody",
            "text": "Choose your account type to get started. You can always upgrade to a vendor account later."
          },
          {
            "type": "RadioButtonsGroup",
            "name": "user_type",
            "label": "Account Type",
            "required": true,
            "data-source": [
              {
                "id": "customer",
                "title": "🛍️ Customer Account",
                "description": "Browse and buy products from vendors"
              },
              {
                "id": "vendor",
                "title": "🏪 Vendor Account",
                "description": "Sell your products and manage your business"
              }
            ]
          },
          {"type": "TextCaption", "text": "💡 Tip: Vendors can also shop as customers!"},
          {
            "type": "Footer",
            "label": "Continue",
            "on-click-action": {
              "name": "navigate",
              "next": {"type": "screen", "name": "CONTACT_INFO"},
              "payload": {}
            }
          }
        ]
      }
    },
    {
      "id": "CONTACT_INFO",
      "title": "Your Contact Information",
      "data": {"user_type": "\${form.user_type}"},
      "layout": {
        "type": "SingleColumnLayout",
        "children": [
          {"type": "TextHeading", "text": "Let's set up your account"},
          {
            "type": "TextBody",
            "text": "We'll use this information to sync your account across platforms and keep you updated."
          },
          {
            "type": "TextInput",
            "name": "email",
            "label": "Email Address *",
            "input-type": "email",
            "required": true,
            "helper-text": "We'll send a verification code to this email"
          },
          {
            "type": "TextInput",
            "name": "phone",
            "label": "Phone Number",
            "input-type": "phone",
            "required": false,
            "helper-text": "Optional - for order updates"
          },
          {
            "type": "TextInput",
            "name": "first_name",
            "label": "First Name",
            "input-type": "text",
            "required": false
          },
          {
            "type": "TextInput",
            "name": "last_name",
            "label": "Last Name",
            "input-type": "text",
            "required": false
          },
          {
            "type": "If",
            "condition": "\${form.user_type} == 'vendor'",
            "then": {
              "type": "TextInput",
              "name": "business_name",
              "label": "Business Name *",
              "input-type": "text",
              "required": true,
              "helper-text": "The name of your business"
            }
          },
          {
            "type": "Footer",
            "label": "Get Verification Code",
            "on-click-action": {
              "name": "data_exchange",
              "payload": {
                "email": "\${form.email}",
                "phone": "\${form.phone}",
                "first_name": "\${form.first_name}",
                "last_name": "\${form.last_name}",
                "business_name": "\${form.business_name}",
                "user_type": "\${form.user_type}"
              }
            }
          }
        ]
      }
    },
    {
      "id": "VERIFICATION",
      "title": "Verify Your Email",
      "data": {"email": "\${data.email}", "verification_sent": true},
      "layout": {
        "type": "SingleColumnLayout",
        "children": [
          {"type": "TextHeading", "text": "Check Your Email"},
          {"type": "TextBody", "text": "We've sent a 6-digit verification code to \${data.email}"},
          {
            "type": "TextInput",
            "name": "verification_code",
            "label": "Verification Code *",
            "input-type": "number",
            "required": true,
            "helper-text": "Enter the 6-digit code from your email"
          },
          {"type": "TextCaption", "text": "⏱️ Code expires in 10 minutes"},
          {
            "type": "Footer",
            "label": "Verify & Complete Signup",
            "on-click-action": {
              "name": "complete",
              "payload": {"verification_code": "\${form.verification_code}"}
            }
          }
        ]
      }
    },
    {
      "id": "SUCCESS",
      "title": "Welcome to Asami!",
      "terminal": true,
      "data": {},
      "layout": {
        "type": "SingleColumnLayout",
        "children": [
          {"type": "TextHeading", "text": "🎉 Account Created!"},
          {
            "type": "TextBody",
            "text": "You're all set! Start exploring amazing products or set up your store."
          },
          {
            "type": "Footer",
            "label": "Start Shopping",
            "on-click-action": {"name": "complete", "payload": {}}
          }
        ]
      }
    }
  ];

  // ==================== PRODUCT CREATION FLOW SCREENS ====================
  static final List<Map<String, dynamic>> _productCreationScreens = [
    {
      "id": "PRODUCT_BASIC_INFO",
      "title": "Add Product",
      "data": {},
      "layout": {
        "type": "SingleColumnLayout",
        "children": [
          {"type": "TextHeading", "text": "Basic Product Information"},
          {
            "type": "TextInput",
            "name": "product_name",
            "label": "Product Name *",
            "input-type": "text",
            "required": true,
            "helper-text": "Clear, descriptive name"
          },
          {
            "type": "TextArea",
            "name": "description",
            "label": "Description *",
            "required": true,
            "helper-text": "Detailed product description"
          },
          {
            "type": "TextInput",
            "name": "short_description",
            "label": "Short Description",
            "input-type": "text",
            "required": false,
            "helper-text": "Brief one-line summary"
          },
          {
            "type": "Dropdown",
            "name": "category",
            "label": "Category *",
            "required": true,
            "data-source": [
              {"id": "electronics", "title": "Electronics"},
              {"id": "fashion", "title": "Fashion & Apparel"},
              {"id": "home", "title": "Home & Living"},
              {"id": "beauty", "title": "Beauty & Personal Care"},
              {"id": "sports", "title": "Sports & Outdoors"},
              {"id": "books", "title": "Books & Media"},
              {"id": "toys", "title": "Toys & Games"},
              {"id": "food", "title": "Food & Beverages"},
              {"id": "other", "title": "Other"}
            ]
          },
          {
            "type": "Footer",
            "label": "Continue",
            "on-click-action": {
              "name": "navigate",
              "next": {"type": "screen", "name": "PRICING_INVENTORY"},
              "payload": {}
            }
          }
        ]
      }
    },
    {
      "id": "PRICING_INVENTORY",
      "title": "Pricing & Inventory",
      "data": {},
      "layout": {
        "type": "SingleColumnLayout",
        "children": [
          {"type": "TextHeading", "text": "Set Price & Stock"},
          {
            "type": "TextInput",
            "name": "base_price",
            "label": "Price (NGN) *",
            "input-type": "number",
            "required": true,
            "helper-text": "Product selling price"
          },
          {
            "type": "TextInput",
            "name": "discount_price",
            "label": "Discount Price (NGN)",
            "input-type": "number",
            "required": false,
            "helper-text": "Leave empty if no discount"
          },
          {
            "type": "TextInput",
            "name": "quantity",
            "label": "Stock Quantity *",
            "input-type": "number",
            "required": true,
            "helper-text": "Available inventory"
          },
          {
            "type": "TextInput",
            "name": "sku",
            "label": "SKU",
            "input-type": "text",
            "required": false,
            "helper-text": "Stock keeping unit (optional)"
          },
          {
            "type": "Footer",
            "label": "Continue",
            "on-click-action": {
              "name": "navigate",
              "next": {"type": "screen", "name": "PRODUCT_VARIANTS"},
              "payload": {}
            }
          }
        ]
      }
    },
    {
      "id": "PRODUCT_VARIANTS",
      "title": "Product Variants",
      "data": {},
      "layout": {
        "type": "SingleColumnLayout",
        "children": [
          {"type": "TextHeading", "text": "Variants (Optional)"},
          {"type": "TextBody", "text": "Add colors, sizes, or other variations"},
          {
            "type": "TextInput",
            "name": "colors",
            "label": "Colors",
            "input-type": "text",
            "required": false,
            "helper-text": "Separate with commas: Red, Blue, Green"
          },
          {
            "type": "TextInput",
            "name": "sizes",
            "label": "Sizes",
            "input-type": "text",
            "required": false,
            "helper-text": "Separate with commas: S, M, L, XL"
          },
          {
            "type": "TextInput",
            "name": "material",
            "label": "Material",
            "input-type": "text",
            "required": false,
            "helper-text": "e.g., Cotton, Leather, Metal"
          },
          {
            "type": "TextInput",
            "name": "brand",
            "label": "Brand",
            "input-type": "text",
            "required": false
          },
          {
            "type": "Footer",
            "label": "Continue",
            "on-click-action": {
              "name": "navigate",
              "next": {"type": "screen", "name": "SHIPPING_INFO"},
              "payload": {}
            }
          }
        ]
      }
    },
    {
      "id": "SHIPPING_INFO",
      "title": "Shipping Details",
      "data": {},
      "layout": {
        "type": "SingleColumnLayout",
        "children": [
          {"type": "TextHeading", "text": "Delivery Information"},
          {
            "type": "CheckboxGroup",
            "name": "free_shipping",
            "label": "Shipping Options",
            "data-source": [
              {"id": "free", "title": "Offer Free Shipping", "enabled": true}
            ]
          },
          {
            "type": "If",
            "condition": "\${form.free_shipping} != 'free'",
            "then": {
              "type": "TextInput",
              "name": "shipping_cost",
              "label": "Shipping Cost (NGN)",
              "input-type": "number",
              "required": false,
              "helper-text": "Cost to ship this item"
            }
          },
          {
            "type": "TextInput",
            "name": "delivery_days",
            "label": "Estimated Delivery Days",
            "input-type": "number",
            "required": false,
            "helper-text": "How many days for delivery"
          },
          {
            "type": "TextInput",
            "name": "weight",
            "label": "Weight (kg)",
            "input-type": "number",
            "required": false,
            "helper-text": "Product weight for shipping"
          },
          {
            "type": "Footer",
            "label": "Create Product",
            "on-click-action": {
              "name": "complete",
              "payload": {
                "product_name": "\${form.product_name}",
                "description": "\${form.description}",
                "short_description": "\${form.short_description}",
                "category": "\${form.category}",
                "base_price": "\${form.base_price}",
                "discount_price": "\${form.discount_price}",
                "quantity": "\${form.quantity}",
                "sku": "\${form.sku}",
                "colors": "\${form.colors}",
                "sizes": "\${form.sizes}",
                "material": "\${form.material}",
                "brand": "\${form.brand}",
                "free_shipping": "\${form.free_shipping}",
                "shipping_cost": "\${form.shipping_cost}",
                "delivery_days": "\${form.delivery_days}",
                "weight": "\${form.weight}"
              }
            }
          }
        ]
      }
    }
  ];

  // ========================= CHECKOUT FLOW SCREENS =========================
  static final List<Map<String, dynamic>> _checkoutScreens = [
    {
      "id": "DELIVERY_ADDRESS",
      "title": "Delivery Address",
      "data": {
        "cart_items": "\${data.cart_items}",
        "subtotal": "\${data.subtotal}"
      },
      "layout": {
        "type": "SingleColumnLayout",
        "children": [
          {"type": "TextHeading", "text": "Where should we deliver?"},
          {
            "type": "TextInput",
            "name": "recipient_name",
            "label": "Recipient Name *",
            "input-type": "text",
            "required": true
          },
          {
            "type": "TextInput",
            "name": "phone",
            "label": "Phone Number *",
            "input-type": "phone",
            "required": true
          },
          {
            "type": "TextInput",
            "name": "address_line1",
            "label": "Street Address *",
            "input-type": "text",
            "required": true
          },
          {
            "type": "TextInput",
            "name": "address_line2",
            "label": "Apartment/Suite",
            "input-type": "text",
            "required": false
          },
          {
            "type": "TextInput",
            "name": "city",
            "label": "City *",
            "input-type": "text",
            "required": true
          },
          {
            "type": "TextInput",
            "name": "state",
            "label": "State *",
            "input-type": "text",
            "required": true
          },
          {
            "type": "TextInput",
            "name": "landmark",
            "label": "Landmark",
            "input-type": "text",
            "required": false,
            "helper-text": "To help delivery find you"
          },
          {
            "type": "Footer",
            "label": "Continue to Payment",
            "on-click-action": {
              "name": "navigate",
              "next": {"type": "screen", "name": "PAYMENT_METHOD"},
              "payload": {}
            }
          }
        ]
      }
    },
    {
      "id": "PAYMENT_METHOD",
      "title": "Payment",
      "data": {
        "subtotal": "\${data.subtotal}",
        "shipping": "\${data.shipping_cost}",
        "total": "\${data.total}"
      },
      "layout": {
        "type": "SingleColumnLayout",
        "children": [
          {"type": "TextHeading", "text": "Choose Payment Method"},
          {"type": "TextBody", "text": "Total: ₦\${data.total}"},
          {
            "type": "RadioButtonsGroup",
            "name": "payment_method",
            "label": "Payment Method *",
            "required": true,
            "data-source": [
              {
                "id": "bank_transfer",
                "title": "💳 Bank Transfer",
                "description": "Pay via bank transfer"
              },
              {
                "id": "mobile_money",
                "title": "📱 Mobile Money",
                "description": "Pay with mobile money"
              },
              {"id": "bitcoin", "title": "₿ Bitcoin", "description": "Pay with Bitcoin"},
              {"id": "ethereum", "title": "Ξ Ethereum", "description": "Pay with Ethereum"},
              {"id": "usdt", "title": "₮ USDT", "description": "Pay with Tether"}
            ]
          },
          {
            "type": "TextArea",
            "name": "notes",
            "label": "Special Instructions",
            "required": false,
            "helper-text": "Any special delivery notes?"
          },
          {
            "type": "Footer",
            "label": "Place Order",
            "on-click-action": {
              "name": "complete",
              "payload": {
                "recipient_name": "\${form.recipient_name}",
                "phone": "\${form.phone}",
                "address_line1": "\${form.address_line1}",
                "address_line2": "\${form.address_line2}",
                "city": "\${form.city}",
                "state": "\${form.state}",
                "landmark": "\${form.landmark}",
                "payment_method": "\${form.payment_method}",
                "notes": "\${form.notes}"
              }
            }
          }
        ]
      }
    }
  ];
}

// Example usage:
// void main() {
//   String signupJson = jsonEncode(AsamiFlows.signupFlow);
//   String productJson = jsonEncode(AsamiFlows.productCreationFlow);
//   String checkoutJson = jsonEncode(AsamiFlows.checkoutFlow);
//
//   print(signupJson); // Send this to WhatsApp Flows API
// }